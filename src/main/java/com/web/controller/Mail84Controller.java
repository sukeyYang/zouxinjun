package com.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by YHLS on 2017/4/12.
 */
@Controller
@RequestMapping("/activity")
public class Mail84Controller {
	@RequestMapping("/index")
		public String index(HttpServletRequest request,
				HttpServletResponse response) {
		request.setAttribute("flag","0");

			return "/jsp/index";
		}

    @RequestMapping("/aboutUs")
		public String aboutUs(HttpServletRequest request,
				HttpServletResponse response) {
			return "/jsp/aboutUs";
		}

	@RequestMapping("/mainActivity")
		public String mainActivity(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/mainActivity";
		}

	@RequestMapping("/message")
		public String message(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/message";
		}

	@RequestMapping("/personalData")
		public String personalData(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/personalData";
		}

	@RequestMapping("/pushMessage")
		public String pushMessage(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/pushMessage";
		}

	@RequestMapping("/suggestion")
		public String suggestion(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/suggestion";
		}

	@RequestMapping("/user")
		public String user(HttpServletRequest request,
			HttpServletResponse response) {
		return "/jsp/user";
		}

}

