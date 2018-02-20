package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.TopicCommentInfo;
import school.coder.mapper.TopicCommentMapper;
import school.coder.service.TopicCommentService;

/**
 * Created by Administrator on 2018/2/20.
 */
@Service
public class TopicCommentServiceImpl implements TopicCommentService {
    @Autowired
    TopicCommentMapper topicCommentMapper;
    @Override
    public int addComment(TopicCommentInfo topicCommentInfo) {
        return topicCommentMapper.addComment(topicCommentInfo);
    }
}
