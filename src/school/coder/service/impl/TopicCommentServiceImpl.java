package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import school.coder.domain.TopicCommentInfo;
import school.coder.mapper.TopicCommentMapper;
import school.coder.service.TopicCommentService;

/**
 * Created by Administrator on 2018/2/20.
 */
public class TopicCommentServiceImpl implements TopicCommentService {
    @Autowired
    TopicCommentMapper topicCommentMapper;
    @Override
    public int addComment(TopicCommentInfo topicCommentInfo) {
        return topicCommentMapper.addComment(topicCommentInfo);
    }
}
