package com.kh.show.common.model.vo;

import lombok.Data;

@Data
public class PageInfo {
    private int totalRecords;
    private int pageSize = 10;
    private int currentPage;
    private int totalPages;
    private int pageBlock = 10;

    // 시작 페이지 계산
    public int getStartPage() {
        return ((currentPage - 1) / pageBlock) * pageBlock + 1;
    }

    // 끝 페이지 계산
    public int getEndPage() {
        int endPage = getStartPage() + pageBlock - 1;
        return Math.min(endPage, totalPages); // endPage가 totalPages를 초과하지 않도록
    }

    // 이전 페이지 블록으로 이동
    public int getPrevBlockPage() {
        return getStartPage() - 1;
    }

    // 다음 페이지 블록으로 이동
    public int getNextBlockPage() {
        return getEndPage() + 1;
    }
}