/**
 * 
 */
package org.jcms.base.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 
 * @Author Abihu[谭朝红] - - -2017年1月29日-上午12:39:10
 * @Info http://www.abihu.org
 * @Description:
 */
public interface BaseDao<T, ID extends Serializable> {
	/**
	 * 添加对象
	 * 
	 * @param t
	 * @return
	 */
	public T save(T t);

	/**
	 * 更新对象
	 * 
	 * @param t
	 *            {@link Object}
	 * @return {@link Object}
	 */
	public T update(T t);

	/**
	 * 删除对象
	 * 
	 * @param t
	 *            {@link Object}
	 * @return {@link Boolean}
	 */
	public boolean delete(T t);

	/**
	 * 判断对象是否为空
	 * 
	 * @param t
	 *            {@link Object}
	 * @return {@link Object}
	 */
	public boolean isEmpty(ID id);

	/**
	 * 根据 id查找对象
	 * 
	 * @param id
	 *            {@link Serializable}
	 * @return {@link Object}
	 */
	public T find(ID id);

	/**
	 * 查询所有的对象
	 * 
	 * @return {@link List}< {@link Object} >
	 */
	public List<T> findAll();

	/**
	 * 根据查询的键值对获取对象列表
	 * 
	 * @param KV
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @return {@link List} < {@link Object} >
	 */
	public List<T> listByKV(Map<String, Object> KV);
	/**
	 * 根据查询参数和排序字段获取排序列表
	 * 
	 * @param KV
	 *            查询字段键值对 {@link Map}< {@link String} , {@link Object} >
	 * @param SKV
	 *            排序字段键值对 {@link Map}< {@link String} , {@link Boolean} >
	 * @return {@link List} < {@link Object} >
	 */
	public List<T> sortListByKV(Map<String, Object> KV, Map<String, Boolean> SKV);

	/**
	 * 根据查询的键值对获取分页对象列表
	 * 
	 * @param start
	 *            {@link Integer}
	 * @param limit
	 *            {@link Integer}
	 * @param KV
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @return {@link List}< {@link Object} >
	 */
	public List<T> pageListByKV(int start, int limit, Map<String, Object> KV);

	/**
	 * 根据查询条件键值对和排序字段获取分页对象列表
	 * 
	 * @param start
	 *            {@link Integer}
	 * @param limit
	 *            {@link Integer}
	 * @param KV
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @param SKV
	 *            {@link Map}< {@link String} , {@link Boolean} >
	 * @return {@link List}< {@link Object} >
	 */
	public List<T> sortPageListByKV(int start, int limit,
			Map<String, Object> KV, Map<String, Boolean> SKV);

	/**
	 * 根据查询键值对获取对象的记录数
	 * 
	 * @param KV
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @return {@link Long}
	 */
	public long size(Map<String, Object> KV);

	/**
	 * 根据查询键值对获取对象
	 * 
	 * @param hql
	 *            {@link String}
	 * @param KV
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @return {@link Object}
	 */
	public Object queryObject(String hql, Map<String, Object> KV);
	/**
	 * 根据查询键值对获取对象列表
	 * 
	 * @param hql
	 *            {@link String}
	 * @param KV
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @return {@link List} < {@link Object} >
	 */
	public List<Object> queryObjectList(String hql, Map<String, Object> KV);

	/**
	 * 更新对象字段
	 * 
	 * @param parameters
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @param conditions
	 *            {@link Map}< {@link String} , {@link Object} >
	 * @return {@link Boolean}
	 */
	public boolean updateParameters(Map<String, Object> parameters,
			Map<String, Object> conditions);

	public <N extends Object> List<N> queryListBySql(String sql,
			Map<String, Object> KV, Class<?> clz, boolean isEntity);

	public <N extends Object> List<N> queryPageListBySql(String sql, int start,
			int limit, Map<String, Object> KV, Map<String, Boolean> SKV);

	public long size(String sql, Map<String, Object> KV);

}
