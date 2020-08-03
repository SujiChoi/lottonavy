package com.bit.lottoNavy.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LottoController {
	
	@RequestMapping(value="index")
	public String index() {
		return "index";
	}
	@RequestMapping(value="index2")
	public String home() {
		return "index2";
	}
	@RequestMapping(value="randomNumber")
	public String randomNum(Model model) {
		int[] numbers= {0,0,0,0,0,0};
		for(int i=0; i<numbers.length; i++) {
			int num=((int)(Math.random()*45))+1;
			if(i==0) {
				numbers[0]=num;
			}
			for(int j=0; j<=i; j++) {
				if(num==numbers[j]) {
					break;
				}else {
					if(j==i) {
						numbers[i]=num;
					}
				}
			}
			if(numbers[i]==0) {
				i--;
			}
		}
		for(int i=0; i<numbers.length; i++) {
			for(int j=0; j<i; j++) {
				if(numbers[j]>numbers[i]) {
					int temp=numbers[i];
					numbers[i]=numbers[j];
					numbers[j]=temp;
				}
			}
		}
		int[] colors=new int[6];
		for(int i=0; i<colors.length; i++) {
			switch((numbers[i]-1)/10) {
			case 0:colors[i]=1; break;
			case 1:colors[i]=2; break;
			case 2:colors[i]=3; break;
			case 3:colors[i]=4; break;
			case 4:colors[i]=5; break;
			}
		}
		model.addAttribute("numberlist", numbers);
		model.addAttribute("colorlist", colors);
		model.addAttribute("desc", "랜덤");
		return "index3";
	}
	@RequestMapping(value="selectNumber")
	public String selectNum(Model model) {
		try {
			String[] url=new String[26];
			String firsturl="https://dhlottery.co.kr/gameResult.do?method=byWin";
			Document firstdoc=Jsoup.connect(firsturl).get();
			Vector<String> vec=new Vector<String>();
			Elements maxnumz=firstdoc.select("#dwrNoList option");
			String[] numz=maxnumz.text().split(" ");
			url[0]=firsturl;
			int j=Integer.parseInt(numz[1]);
			for(int i=1; i<26; i++) {
				url[i]="https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo="+j;
				j--;
			}
			for(int i=0; i<url.length; i++) {
				Document doc=Jsoup.connect(url[i]).get();
				Elements nums=doc.select("span.ball_645.lrg.ball1");
				for(Element element:nums) {
					vec.add(element.text());
				}
				nums=doc.select("span.ball_645.lrg.ball2");
				for(Element element:nums) {
					vec.add(element.text());
				}
				nums=doc.select("span.ball_645.lrg.ball3");
				for(Element element:nums) {
					vec.add(element.text());
				}
				nums=doc.select("span.ball_645.lrg.ball4");
				for(Element element:nums) {
					vec.add(element.text());
				}
				nums=doc.select("span.ball_645.lrg.ball5");
				for(Element element:nums) {
					vec.add(element.text());
				}
			}
			HashMap<String, Integer> numRank=new HashMap<String, Integer>();
			List<String> keySetList=new ArrayList<String>(numRank.keySet());
			for(int i=0; i<vec.size(); i++) {
				if(numRank.containsKey(vec.get(i))) {
					int value=numRank.get(vec.get(i));
					numRank.replace(vec.get(i), value+1);
				}else {
					numRank.put(vec.get(i), 1);
				}
			}
			List<String> keys=new ArrayList<String>(numRank.keySet());
			final HashMap<String, Integer> nr=numRank;
			Collections.sort(keys, new Comparator<String>() {
				@Override
				public int compare(String o1, String o2) {
					return nr.get(o2).compareTo(nr.get(o1));
				}
			});
			int[] numbers=new int[6];
			for(int i=0; i<6; i++) {
				numbers[i]=Integer.parseInt(keys.get(i));
			}
			for(int i=0; i<numbers.length; i++) {
				for(int j1=0; j1<i; j1++) {
					if(numbers[j1]>numbers[i]) {
						int temp=numbers[i];
						numbers[i]=numbers[j1];
						numbers[j1]=temp;
					}
				}
			}
			int[] colors=new int[6];
			for(int i=0; i<colors.length; i++) {
				switch((numbers[i]-1)/10) {
				case 0:colors[i]=1; break;
				case 1:colors[i]=2; break;
				case 2:colors[i]=3; break;
				case 3:colors[i]=4; break;
				case 4:colors[i]=5; break;
				}
			}
			model.addAttribute("numberlist", numbers);
			model.addAttribute("colorlist", colors);
			model.addAttribute("desc", "이번 주의");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "index3";
	}

}
