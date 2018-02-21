package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import school.coder.domain.SectionInfo;
import school.coder.mapper.SectionMapper;
import school.coder.service.SectionService;

import java.util.List;

/**
 * Created by Administrator on 2018/2/21.
 */
public class SectionServiceImpl implements SectionService {
    @Autowired
    private SectionMapper sectionMapper;
    @Override
    public List<SectionInfo> getAllSections() {
        return sectionMapper.getAllSections();
    }
}
