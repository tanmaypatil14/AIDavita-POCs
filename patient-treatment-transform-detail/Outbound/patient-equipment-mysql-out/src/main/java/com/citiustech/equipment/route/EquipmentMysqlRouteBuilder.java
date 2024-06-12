package com.citiustech.equipment.route;

import java.sql.SQLException;

import org.apache.activemq.ConnectionFailedException;
import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;

import com.citiustech.equipment.processor.UpdateEquipmentFlagProcessor;

public class EquipmentMysqlRouteBuilder extends RouteBuilder {
	
	private String sourceQueue;
	private String updateEquipementQuery;
	
	public String getSourceQueue() {
		return sourceQueue;
	}

	public void setSourceQueue(String sourceQueue) {
		this.sourceQueue = sourceQueue;
	}

	public String getUpdateEquipementQuery() {
		return updateEquipementQuery;
	}

	public void setUpdateEquipementQuery(String updateEquipementQuery) {
		this.updateEquipementQuery = updateEquipementQuery;
	}

	@Override
	public void configure() throws Exception {
		
		onException(Exception.class)
		.log(LoggingLevel.ERROR, "Exception occurred: ${exception.message}")
		.handled(true);
		
		onException(ConnectionFailedException.class)
		.handled(true)
		.log(LoggingLevel.ERROR, "Failed to connect ActiveMQ : ${exception.message}");
		
//      It will check for SQL Syntax is correct or not
		onException(SQLException.class)
		.handled(true)
		.log(LoggingLevel.ERROR, "SQL Exception occured : ${exception.message}");

		from(getSourceQueue())
//		from("file:src/main/resources/data/in?noop=true")
		.routeId("equipmentMysqlOut")
		        .log(LoggingLevel.INFO, "Received treatmentDetails from topic : ${body}")
				.process(new UpdateEquipmentFlagProcessor())
		        .choice()
		        .when(header("isActive").isEqualTo(true))
		           .log(LoggingLevel.INFO, "Received active patient equipment detail from processor : ${body}")
		           .to(getUpdateEquipementQuery())
		        .otherwise()
		           .log(LoggingLevel.INFO, "Received inactive patient equipment detail from processor : ${body}")
		           .end()
		        .log(LoggingLevel.INFO, "Equipment detail flag updated according to patient status");
	}

}
