package org.sang.service;

import org.sang.bean.StatisticUnit;
import org.sang.dao.MeetingDao;

import java.util.List;

public class StatisticUnitService {
    private MeetingDao meetingDao = new MeetingDao();

    public List<StatisticUnit> allMeetingRoomStatistic(int days) {
        return meetingDao.allMeetingRoomsStatistic(days);
    }
}
