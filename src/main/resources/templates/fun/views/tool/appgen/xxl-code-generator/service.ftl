package com.fun.project.app.user.service;

import com.fun.project.app.business.entity.${classInfo.className};
import java.util.List;

/**
* ${classInfo.classComment}
*
* @author DJun
* @date ${.now?string('yyyy/MM/dd')}
*/
public interface I${classInfo.className}Service {

    /**
    * 查询${classInfo.classComment}列表
    * @param ${classInfo.className?uncap_first} 查询对象
    * @return 查询列表
    */
    List<${classInfo.className}> select${classInfo.className}List(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 通过Id查询 ${classInfo.classComment}
    * @param ${classInfo.conversionPrimaryKey} 查询Id
    * @return 查询对象
    */
    ${classInfo.className} select${classInfo.className}ById(long ${classInfo.conversionPrimaryKey});

    /**
    * 新增${classInfo.classComment}
    * @param ${classInfo.className?uncap_first} 新增对象
    * @return 插入行数
    */
    int insert${classInfo.className}(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 修改${classInfo.classComment}信息
    * @param  ${classInfo.className?uncap_first} 用户对象
    * @return 更新行数
    */
    int update${classInfo.className}(${classInfo.className} ${classInfo.className?uncap_first});

    /**
    * 通过id删除${classInfo.classComment}
    * @param ${classInfo.conversionPrimaryKey} 删除id
    * @return 删除行数
    */
    int delete${classInfo.className}ById(long ${classInfo.conversionPrimaryKey});

    /**
    * 通过id批量删除${classInfo.classComment}
    * @param ${classInfo.conversionPrimaryKey}s 删除ids
    * @return 删除行数
    */
    int delete${classInfo.className}ByIds(String ${classInfo.conversionPrimaryKey}s);
}
