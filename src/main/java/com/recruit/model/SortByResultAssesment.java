package com.recruit.model;

import com.recruit.entity.Candidate;

import java.util.Comparator;

class SortByResultAssesment implements Comparator<Candidate>
{
    // Used for sorting in ascending order of
    // roll number
    public int compare(Candidate a, Candidate b)
    {
        return (int) (a.getResultAssesment() - b.getResultAssesment());
    }
}
