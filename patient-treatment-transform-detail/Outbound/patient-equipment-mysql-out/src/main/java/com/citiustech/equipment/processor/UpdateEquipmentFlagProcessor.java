package com.citiustech.equipment.processor;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UpdateEquipmentFlagProcessor implements Processor {

	private static Logger logger = LoggerFactory.getLogger(UpdateEquipmentFlagProcessor.class);

	@Override
	public void process(Exchange exchange) throws Exception {

		boolean flag = false;

		String jsonData = exchange.getIn().getBody(String.class);

		JSONObject treatmentDetail = new JSONObject(jsonData);
		JSONObject patientDemographicDetail = treatmentDetail.getJSONObject("patientDemographicDetails");
		Integer patientId = (Integer) patientDemographicDetail.get("patientId");
		JSONObject equipmentDetail = treatmentDetail.getJSONObject("equipmentDetails");
		Integer equipmentId = (Integer) equipmentDetail.get("equipmentId");
		exchange.getIn().setHeader("equipmentId", equipmentId);

		if (!treatmentDetail.isEmpty()) {
			logger.info("treatmentDetails exist = " + treatmentDetail);
		} else {
			logger.error("treatmentDetails does not exist");
		}

		if (!equipmentDetail.isEmpty() && treatmentDetail.has("equipmentDetails")) {

			logger.info("equipmentDetail exist = " + equipmentDetail);

			if ((boolean) patientDemographicDetail.get("active")) {
				logger.info("patient is active with id : " + patientId);
				flag = true;
				exchange.getIn().setHeader("isActive", flag);
				
				exchange.getIn().setHeader("inUsed", flag);
				equipmentDetail.put("inUsed", flag);

				exchange.getIn().setBody(treatmentDetail);

				logger.info("Updated equipment flag for active  patient id " + patientId + " with equipment id : "
						+ equipmentId);
			} else {
				logger.info("Received inactive patient with id " + patientId + " and inactive patient treatment details : "
						+ treatmentDetail);
				equipmentDetail.put("inUsed", flag);
				exchange.getIn().setHeader("isActive", flag);
				exchange.getIn().setHeader("inUsed", flag);
				exchange.getIn().setBody(treatmentDetail);
			}
		} else {
			logger.error("equipmentDetail does not exist");
		}

	}

}