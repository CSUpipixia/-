package org.sang.bean;

import java.util.List;

public class StatisticUnit {
    private int frequency;
    private int meetingRoomId;
    private Integer a;

    private List<Integer> frequencyList;
    private String roomName;

    public StatisticUnit() {
    }

    public StatisticUnit(int meetingRoomId, String roomName) {
        this.frequency = 1;
        this.meetingRoomId = meetingRoomId;
        this.roomName = roomName;
    }

    public int getFrequency() {
        return frequency;
    }

    public void setFrequency(int frequency) {
        this.frequency = frequency;
    }

    public List<Integer> getFrequencyList() {
        return frequencyList;
    }

    public void setFrequencyList(List<Integer> frequencyList) {
        this.frequencyList = frequencyList;
    }

    public int getMeetingRoomId() {
        return meetingRoomId;
    }

    public void setMeetingRoom(int meetingRoomId) {
        this.meetingRoomId = meetingRoomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public void countUp()  {
        frequency++;
    }

    @Override
    public String toString() {
        return "StatisticUnit{" +
                "frequency=" + frequency +
                ", meetingRoomId=" + meetingRoomId +
                ", frequencyList=" + frequencyList +
                ", roomName='" + roomName + '\'' +
                '}';
    }
}
