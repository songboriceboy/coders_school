package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.TopicInfo;
import school.coder.mapper.TopicMapper;
import school.coder.mapper.UserMapper;
import school.coder.service.TopicService;

/**
 * Created by Administrator on 2018/2/19.
 */
@Service
public class TopicServiceImpl implements TopicService {
    @Autowired
    private TopicMapper topicMapper;
    @Override
    public int insertTopic(TopicInfo topicInfo) {
        return topicMapper.insertTopic(topicInfo);
    }
}
