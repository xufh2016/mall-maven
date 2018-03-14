package com.situ.mall.portal.tool;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.constant.Const;
import com.situ.mall.portal.vo.CartVO;

public class CookieJsonConversion {
	// private String CART_COOKIE = "cartCookie";
	private CookieJsonConversion() {
		// TODO Auto-generated constructor stub
	}

	public static CartVO cookieToObject(HttpServletRequest request) {
		CartVO cartVo = null;
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象中不为null才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		// 获取cookies
		Cookie[] cookies = request.getCookies();
		if (cookies.length > 0 && null != cookies) {
			for (Cookie cookie : cookies) {
				if (Const.CookieName.CART_COOKIE.equals(cookie.getName())) {
					String cartVoValue = cookie.getValue();
					try {
						// 将cookie中的存储的json转为对象
						cartVo = objectMapper.readValue(cartVoValue, CartVO.class);

					} catch (JsonParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JsonMappingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

		}
		return cartVo;
	}

	/**
	 * 将CartVo对象设置到Cookie中
	 * 
	 * @param response
	 * @param cartVo
	 */
	public static void objectToJson(HttpServletResponse response, CartVO cartVo) {
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象中不为null才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		// 将cartVo对象以json形式放到cookie
		StringWriter stringWriter = new StringWriter();
		try {
			objectMapper.writeValue(stringWriter, cartVo);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Cookie cookie = new Cookie(Const.CookieName.CART_COOKIE, stringWriter.toString());
		// 设置cookie的存储时间
		cookie.setMaxAge(60 * 60 * 24);// 单位秒
		// 设置cookie路径
		cookie.setPath("/");
		// 将cookie发送到浏览器
		response.addCookie(cookie);
	}

}
