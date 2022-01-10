/*
 * Copyright 2008-2009 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package library.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import egovframework.rte.ptl.mvc.filter.HTMLTagFilterRequestWrapper;

/**
 * HTMLTagFilter.java
 * 
 * @author 실행환경 개발팀 함철
 * @since 2009.06.01
 * @version 1.0
 *
 *          <pre>
 * == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.05.30  함철            최초 생성
 *
 *          </pre>
 */
public class HTMLTagFilter implements Filter {

	@SuppressWarnings("unused")
	private FilterConfig config;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		if (checkUrl(req)) { // /admin/로 시작하는 url은 filter를 하지 않는다.(아래의 checkUrl method)
			chain.doFilter(request, response);
		} else {
			chain.doFilter(new HTMLTagFilterRequestWrapper((HttpServletRequest) request), response);
		}
	}

	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

	public void destroy() {

	}

	// "/admin/"로 시작하는 url인지 확인하는 method
	private boolean checkUrl(HttpServletRequest req) {

		String path = req.getContextPath();
		String uri = req.getRequestURI().toString().trim();
		
		if (uri.startsWith(path + "/board/article")) {
			return true;
		} else {
			return false;
		}

	}
}
