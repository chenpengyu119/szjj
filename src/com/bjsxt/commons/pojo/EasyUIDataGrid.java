package com.bjsxt.commons.pojo;

import java.util.List;

/**
 * easyui 中datagrid分页时数据模板
 */
public class EasyUIDataGrid {
    private long total;
    private List<?> rows;


    public EasyUIDataGrid() {
    }

    public EasyUIDataGrid(long total, List<?> rows) {
        this.total = total;
        this.rows = rows;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }
}
