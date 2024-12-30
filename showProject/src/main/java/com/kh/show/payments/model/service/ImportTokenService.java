package com.kh.show.payments.model.service;

import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ImportTokenService {

	 public String getToken() {
	        try {
	            // 요청 바디 설정
	            Map<String, String> jsonMap = new HashMap<>();
	            jsonMap.put("imp_key", "2323070778660535");
	            jsonMap.put("imp_secret", "IngmQdoVSwsDflBVemN0BdqDmNFv23GLsZj7wu2Z5e5WKAwzCsZUKAxHcLPEnP6mvulANGpV5hUmylMA");

	            ObjectMapper objectMapper = new ObjectMapper();
	            String requestBody = objectMapper.writeValueAsString(jsonMap);

	            // HttpClient 생성
	            HttpClient client = HttpClient.newHttpClient();

	            // HttpRequest 생성
	            HttpRequest request = HttpRequest.newBuilder()
	                    .uri(URI.create("https://api.iamport.kr/users/getToken")) // API URL
	                    .header("Content-Type", "application/json") // 헤더 설정
	                    .POST(HttpRequest.BodyPublishers.ofString(requestBody)) // POST 요청
	                    .build();

	            // 동기적으로 요청 전송 및 응답 받기
	            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

	            // 응답 본문 반환
	            return response.body();

	        } catch (Exception e) {
	            throw new RuntimeException("HTTP 요청 실패: " + e.getMessage(), e);
	        }
	    }
	 
	 
	 
	 
	 
	 
	   public String getPaymentDetails(String token, String merchant_uid) {
	        try {
	            HttpClient client = HttpClient.newHttpClient();
	            String url = "https://api.iamport.kr/payments/find/" + URLEncoder.encode(merchant_uid, StandardCharsets.UTF_8);
	            
	            System.out.println("사용 중인 토큰: " + token);
	            System.out.println(merchant_uid);
	            
	            
	            HttpRequest request = HttpRequest.newBuilder()
	                    .uri(URI.create(url))
	                    .header("Authorization", token) // 발급받은 토큰 추가
	                    .GET()
	                    .build();

	            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
	            
	            System.out.println(response.body());
	            
	            // 응답 본문 반환
	            return response.body();

	        } catch (Exception e) {
	            throw new RuntimeException("결제 정보 조회 실패: " + e.getMessage(), e);
	        }
	    }
	 
}

