package com.bit.lottoNavy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class thislotto {
	static String bonus="";
	
	public Vector<String> nlist() throws IOException{
		String firsturl="https://dhlottery.co.kr/gameResult.do?method=byWin";
		Vector<String> vec=new Vector<String>();
		Document doc=Jsoup.connect(firsturl).get();
		Elements nums=doc.select(".num.win p span");
		for(Element element:nums) {
			vec.add(element.text());
		}
		return vec;
	}
	
	public String bonusNum() throws Exception {
		
		String url = "https://dhlottery.co.kr/gameResult.do?method=byWin";
		
		Document doc = Jsoup.connect(url).get();
		
		Elements elelment = doc.select(".num.bonus p");
		
		bonus = elelment.text();
		/* System.out.println(doc.toString()); */
		
		return bonus;
		
	}
	
	public static Vector<String> plist() throws IOException{
		String firsturl="https://dhlottery.co.kr/gameResult.do?method=byWin";
		Vector<String> pri=new Vector<String>();
		Document doc=Jsoup.connect(firsturl).get();
		Elements cash=doc.select(".tbl_data_col tbody tr td.tar");
		for(Element element:cash) {
			pri.add(element.text());
		}
		
		return pri;
	}
	
	public static void main(String[] args) throws IOException {
		
		/*
		 * try { Vector<String> prize=plist(); System.out.print("당첨금액 : "); for(String
		 * cashPrize:prize) { System.out.print(cashPrize+" "); } }catch(Exception e) {
		 * e.printStackTrace(); }
		 */
	}
}

