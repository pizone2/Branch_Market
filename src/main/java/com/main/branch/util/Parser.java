package com.main.branch.util;

import org.jsoup.Jsoup;

public class Parser {
	public static String html2text(String html) {
	    return Jsoup.parse(html).text();
	}
}
