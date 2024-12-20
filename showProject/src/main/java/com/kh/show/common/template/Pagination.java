package com.kh.show.common.template;

import java.util.ArrayList;
import java.util.List;

import javax.xml.crypto.Data;

import com.kh.show.common.model.vo.PageInfo;

public class Pagination {
    private int totalRecords;  // 총 데이터 수
    private int pageSize;      // 한 페이지에 표시할 항목 수
    private int currentPage;   // 현재 페이지 번호

    public Pagination(int totalRecords, int pageSize, int currentPage) {
        this.totalRecords = totalRecords;
        this.pageSize = pageSize;
        this.currentPage = currentPage;
    }
    /*
    public PageInfo getPageInfo() {
        return new PageInfo(totalRecords, pageSize, currentPage);
    }
     */
    // 데이터베이스에서 데이터를 페이징 처리하여 가져오는 메서드
    public List<Data> getPaginatedData() {
        int startIndex = (currentPage - 1) * pageSize;
        // 실제 DB에서 startIndex와 pageSize를 이용해 데이터를 가져옴
        return fetchDataFromDatabase(startIndex, pageSize);
    }

    private List<Data> fetchDataFromDatabase(int startIndex, int pageSize) {
        // 여기에 실제 DB 쿼리 로직을 넣으면 됩니다.
        // 예시: SELECT * FROM data LIMIT ? OFFSET ?
        return new ArrayList<>();
    }
}
