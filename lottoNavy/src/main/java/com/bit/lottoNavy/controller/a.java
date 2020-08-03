package com.bit.lottoNavy.controller;

import java.util.ArrayList;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class a {

	static RConnection connection = null;

	//생성자
	public a() {
	}
	
	public static ArrayList<Double> getlotto() {	
		
		double[] listlotto = null;
		ArrayList<Double> lotto = new ArrayList<Double>();
		
		try {
			
			connection = new RConnection();

			//Rserve에 접속하기

				//String vector = "c(1,2,3,4)";
				//connection.eval("meanVal=mean(" + vector + ")");
				//double mean = connection.eval("meanVal").asDouble();
				//System.out.println("The mean of given vector is=" + mean);
				//connection.eval("aa <- \"김씨\"");
				//System.out.println(connection.eval("aa").asString());
				
				
				connection.eval("library(rvest)");
				connection.eval("library(R6)");
				connection.eval("library(Rserve)");
				connection.eval("url_base = \"https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo=\"");
				connection.eval("url = paste0(url_base)");
				connection.eval("htxt = read_html(url)");
				
				
				connection.eval("table = html_nodes(htxt,'h4')");
				connection.eval("table2 = html_nodes(table,'strong')");
				connection.eval("num = html_text(table2)");
				connection.eval("num = substr(num,0,3)");
				connection.eval("num = as.numeric(num)"); //920회
				
				double recentlotto = connection.eval("num").asDouble();
				System.out.println(recentlotto);
				connection.eval("");
				connection.eval("i = 1");
				//테이블 만들기
				connection.eval("tbllotto = matrix(0,nrow = 53,ncol = 7)");
				connection.eval("tonum = num - 52");
				connection.eval("for(page in tonum:num){\n "
						+ "url = paste0(url_base,page) \n"
						+ "htxt = read_html(url) \n"
						+ "table = html_nodes(htxt,'.nums') \n"
						+ "content = html_nodes(table,'p') \n"
						+ "content2 = html_nodes(table,'span') \n"
						+ "reviews = html_text(content2) \n"
						+ "tbllotto[i,] = reviews \n"
						+ "i = i+1}");	
				
				connection.eval("word_count <- table(tbllotto)");
				
				connection.eval("a = as.data.frame(word_count)");
				connection.eval("aa = c(1,  10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 2,  20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 3,  30, 31, 32, 33, 34, 35,36, 37, 38, 39, 4,  40,41, 42, 43, 44, 45, 5,  6,  7,  8,  9) ");
				connection.eval("ab = a[,2]");
				connection.eval("abc <- data.frame(aa, ab)");
				connection.eval("abc_order <- abc[ order(aa, ab),]");				
				listlotto = connection.eval("abc_order[,2]").asDoubles();
				System.out.println(listlotto[0]+" "+listlotto[44]);
				
				connection.eval("point1 = sum(abc_order[,2][1:10])");
				connection.eval("point2 = sum(abc_order[,2][11:20])");
				connection.eval("point3 = sum(abc_order[,2][21:30])");
				connection.eval("point4 = sum(abc_order[,2][31:40])");
				connection.eval("point5 = sum(abc_order[,2][41:45])");
				
				connection.eval("point = sum(abc_order[,2])");
				
				connection.eval("pointA1 = point1/point");
				connection.eval("pointA2 = point2/point");
				connection.eval("pointA3 = point3/point");
				connection.eval("pointA4 = point4/point");
				connection.eval("pointA5 = point5/point");
				
				connection.eval("pointA1 = round(pointA1, 2)*100");
				connection.eval("pointA2 = round(pointA2, 2)*100");
				connection.eval("pointA3 = round(pointA3, 2)*100");
				connection.eval("pointA4 = round(pointA4, 2)*100");
				connection.eval("pointA5 = round(pointA5, 2)*100");
				
				double point1 = connection.eval("pointA1").asDouble();
				double point2 = connection.eval("pointA2").asDouble();
				double point3 = connection.eval("pointA3").asDouble();
				double point4 = connection.eval("pointA4").asDouble();
				double point5 = connection.eval("pointA5").asDouble();
				
				for(int i=0; i<45; i++) {
					lotto.add(listlotto[i]);
				}
				lotto.add(point1);
				lotto.add(point2);
				lotto.add(point3);
				lotto.add(point4);
				lotto.add(point5);
				
		} catch (RserveException e) {
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		} finally {
			connection.close();
		}
		
		return lotto;
	}

}