package stock.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.InProduct;
import model.InProductDao;

public class InProductListSearch implements CommandProcess {
	
		public String requestPro(HttpServletRequest request, HttpServletResponse response) {
			final int ROW_PER_PAGE = 10; // 한페이지에 10개씩
			final int PAGE_PER_BLOCK = 10; // 한블럭에 10페이지
			
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals(""))
				pageNum = "1";
			
			int currentPage = Integer.parseInt(pageNum);
			
			String searchField = request.getParameter("searchField");
			String keyword = request.getParameter("keyword");
			
			InProductDao ipd = InProductDao.getInstance();
			
			int total2 = ipd.getTotal2(searchField, keyword);
			
			int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 시작번호 (페이지번호 - 1) * 페이지당 갯수+ 1
			int endRow = startRow + ROW_PER_PAGE - 1; // 끝번호 시작번호 + 페이지당개수 - 1
			
			List<InProduct> getSearch = ipd.getSearch(startRow, endRow,searchField, keyword);
			int totalPage = (int) Math.ceil((double) total2 / ROW_PER_PAGE); // 총 페이지 수
			// 시작페이지 현재페이지 - (현재페이지 - 1)%10
			int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
			// 끝페이지 시작페이지 + 블록당페이지 수 - 1
			int endPage = startPage + PAGE_PER_BLOCK - 1;
			// 총 페이지보다 큰 endPage나올 수 없다
			if (endPage > totalPage)
				endPage = totalPage;
			
			String[] searchEn = {"s.seller_no", "s.seller_name", "p.product_no", "p.product_name"};
			String[] searchKr = {"업체코드", "업체명", "상품코드", "상품명"};
			String searchFiledKr ="";
			for (int i =0 ; i < searchEn.length;i++) {
				if (searchField.equals(searchEn[i])) {
					searchFiledKr = searchKr[i];
					break;
				}
			}

			// JSP에서 jstl로 사용하는 변수와 값을 전달
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("searchField", searchField);
			request.setAttribute("searchFiledKr", searchFiledKr);
			request.setAttribute("keyword", keyword);
			request.setAttribute("getSearch", getSearch);
			
			return "/stockView/inProductListSearch.jsp";
		}

}
