package org.sang.service;

import org.sang.bean.MeetingRoom;
import org.sang.dao.MeetingRoomDao;

import java.util.List;

public class MeetingRoomService {
    private MeetingRoomDao meetingRoomDao = new MeetingRoomDao();
    public int insert(MeetingRoom meetingRoom) {
        return meetingRoomDao.insert(meetingRoom);
    }
    public List<MeetingRoom> getAllMeetingRoom(){
        return meetingRoomDao.getAllMeetingRoom();
    }
    public MeetingRoom getMeetingRoomById(int id) {
        return meetingRoomDao.getMeetingRoomById(id);
    }
    public int update(MeetingRoom meetingRoom) {
        return meetingRoomDao.update(meetingRoom);
    }
}
