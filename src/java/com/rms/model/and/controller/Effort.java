/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rms.model.and.controller;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sean Patrick T. Tan
 */
public class Effort {
    
    private int projId,empId,count;
    private String empName;
    private List<Float> jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dece;
    private List<Integer> year;

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }
    
    public int getProjId() {
        return projId;
    }

    public void setProjId(int projId) {
        this.projId = projId;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<Float> getJan() {
        return jan;
    }

    public void setJan(List<Float> jan) {
        this.jan = jan;
    }

    public List<Float> getFeb() {
        return feb;
    }

    public void setFeb(List<Float> feb) {
        this.feb = feb;
    }

    public List<Float> getMar() {
        return mar;
    }

    public void setMar(List<Float> mar) {
        this.mar = mar;
    }

    public List<Float> getApr() {
        return apr;
    }

    public void setApr(List<Float> apr) {
        this.apr = apr;
    }

    public List<Float> getMay() {
        return may;
    }

    public void setMay(List<Float> may) {
        this.may = may;
    }

    public List<Float> getJun() {
        return jun;
    }

    public void setJun(List<Float> jun) {
        this.jun = jun;
    }

    public List<Float> getJul() {
        return jul;
    }

    public void setJul(List<Float> jul) {
        this.jul = jul;
    }

    public List<Float> getAug() {
        return aug;
    }

    public void setAug(List<Float> aug) {
        this.aug = aug;
    }

    public List<Float> getSep() {
        return sep;
    }

    public void setSep(List<Float> sep) {
        this.sep = sep;
    }

    public List<Float> getOct() {
        return oct;
    }

    public void setOct(List<Float> oct) {
        this.oct = oct;
    }

    public List<Float> getNov() {
        return nov;
    }

    public void setNov(List<Float> nov) {
        this.nov = nov;
    }

    public List<Float> getDece() {
        return dece;
    }

    public void setDece(List<Float> dece) {
        this.dece = dece;
    }

    public List<Integer> getYear() {
        return year;
    }

    public void setYear(List<Integer> year) {
        this.year = year;
    }
    
}
