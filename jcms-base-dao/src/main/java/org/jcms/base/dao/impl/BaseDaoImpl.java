/**
 * 
 */
package org.jcms.base.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.jcms.base.dao.BaseDao;

/**
 * @Author Abihu[谭朝红] - - -2017年1月29日-上午1:36:19
 * @Info http://www.abihu.org
 * @Description:
 */
public class BaseDaoImpl<T,ID extends Serializable> implements BaseDao<T, ID> {
	
	private SessionFactory sessionFactory;
	
	private Class<?> entityClass;
	
	public Class<?> getEntityClass(){
		if(entityClass == null){
			Type type = this.getClass().getGenericSuperclass();
			if(type instanceof ParameterizedType){
				Type[] types = ((ParameterizedType)type).getActualTypeArguments();
				entityClass = (Class<?>)types[0];
			}
		}
		return entityClass;
	}
	
	/**
	 * @param sessionFactory the sessionFactory to set
	 */
	@Inject
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * @return the sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#save(java.lang.Object)
	 */
	@Override
	public T save(T t) {
		this.getSession().save(t);
		return t;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#update(java.lang.Object)
	 */
	@Override
	public T update(T t) {
		this.getSession().update(t);
		return t;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#delete(java.lang.Object)
	 */
	@Override
	public boolean delete(T t) {
		this.getSession().delete(t);
		return true;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#isEmpty(java.lang.Object)
	 */
	@Override
	public boolean isEmpty(ID id) {
		@SuppressWarnings("unchecked")
		T t = (T)this.getSession().get(entityClass, id);
		if(t!=null){
			return false;
		}else{
			return true;
		}
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#find(java.io.Serializable)
	 */
	@Override
	public T find(ID id) {
		@SuppressWarnings("unchecked")
		T t = (T)this.getSession().get(entityClass, id);
		return t;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#findAll()
	 */
	@Override
	public List<T> findAll() {
		String hql = "from "+getEntityClass().getName();
		@SuppressWarnings("unchecked")
		List<T> list = this.getSession().createQuery(hql).list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#listByKV(java.util.Map)
	 */
	@Override
	public List<T> listByKV(Map<String, Object> KV) {
		String hql = "from "+getEntityClass().getName()+" as e ";
		hql = this.setHQLParams(hql, KV);
		Query query = this.getSession().createQuery(hql);
		this.setQueryParams(query, KV);
		@SuppressWarnings("unchecked")
		List<T> list = query.list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#sortListByKV(java.util.Map, java.util.Map)
	 */
	@Override
	public List<T> sortListByKV(Map<String, Object> KV, Map<String, Boolean> SKV) {
		String hql = "from "+this.getEntityClass().getName()+" as e ";
		hql = this.setQuerySort(this.setHQLParams(hql, KV), SKV);
		Query query = this.getSession().createQuery(hql);
		this.setQueryParams(query, KV);
		@SuppressWarnings("unchecked")
		List<T> list = query.list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#pageListByKV(int, int, java.util.Map)
	 */
	@Override
	public List<T> pageListByKV(int start, int limit, Map<String, Object> KV) {
		String hql = "from "+this.getEntityClass().getName()+" as e ";
		hql = this.setHQLParams(hql, KV);
		Query query = this.getSession().createQuery(hql);
		this.setQueryParams(query, KV);
		@SuppressWarnings("unchecked")
		List<T> list = query.setFirstResult(start).setMaxResults(limit).list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#sortPageListByKV(int, int, java.util.Map, java.util.Map)
	 */
	@Override
	public List<T> sortPageListByKV(int start, int limit,
			Map<String, Object> KV, Map<String, Boolean> SKV) {
		String hql = "from "+this.getEntityClass().getName()+" as e ";
		hql = this.setQuerySort(this.setHQLParams(hql, KV), SKV);
		Query query = this.getSession().createQuery(hql);
		this.setQueryParams(query, KV);
		@SuppressWarnings("unchecked")
		List<T> list = query.setFirstResult(start).setMaxResults(limit).list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#size(java.util.Map)
	 */
	@Override
	public long size(Map<String, Object> KV) {
		String hql = "select count(*) from "+this.getEntityClass().getName()+" as e ";
		hql = this.setHQLParams(hql, KV);
		Query query = this.getSession().createQuery(hql);
		this.setQueryParams(query, KV);
		return (long) query.uniqueResult();
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#queryObject(java.lang.String, java.util.Map)
	 */
	@Override
	public Object queryObject(String hql, Map<String, Object> KV) {
		hql = this.setHQLParams(hql, KV);
		Query query = this.getSession().createQuery(hql);
		this.setQueryParams(query, KV);
		Object o = query.uniqueResult();
		return o;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#queryObjectList(java.lang.String, java.util.Map)
	 */
	@Override
	public List<Object> queryObjectList(String hql, Map<String, Object> KV) {
		hql = this.setHQLParams(hql, KV);
		Query query = this.getSession().createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Object> list = query.list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#updateParameters(java.util.Map, java.util.Map)
	 */
	@Override
	public boolean updateParameters(Map<String, Object> parameters,
			Map<String, Object> conditions) {
		boolean flag = false;
		if(!conditions.isEmpty()&&!parameters.isEmpty()){
			String hql = "update "+this.getEntityClass().getName()+" as e  set ";
			Set<String> keys = parameters.keySet();
			for(String key:keys){
				hql += "e."+key+"='"+parameters.get(key)+"',";
			}
			int i1 = hql.lastIndexOf(",");
			hql = hql.substring(0, i1)+" where ";
			Set<String> keys1 = conditions.keySet();
			for(String key:keys1){
				hql += "e."+key+"='"+conditions.get(key)+", and ";
			}
			int i2 = hql.lastIndexOf("and");
			hql = hql.substring(0, i2);
			int f = this.getSession().createQuery(hql).executeUpdate();
			if(f>0){
				flag = true;
			}
		}
		return flag;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#queryListBySql(java.lang.String, java.util.Map, java.lang.Class, boolean)
	 */
	@Override
	public <N> List<N> queryListBySql(String sql, Map<String, Object> KV,
			Class<?> clz, boolean isEntity) {
		SQLQuery query = this.getSession().createSQLQuery(sql);
		this.setQueryParams(query, KV);
		if(isEntity){
			query.addEntity(clz);
		}else{
			query.setResultTransformer(Transformers.aliasToBean(clz));
		}
		@SuppressWarnings("unchecked")
		List<N> list = query.list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#queryPageListBySql(java.lang.String, int, int, java.util.Map, java.util.Map)
	 */
	@Override
	public <N> List<N> queryPageListBySql(String sql, int start, int limit,
			Map<String, Object> KV, Map<String, Boolean> SKV) {
		sql = this.setQuerySort(sql, SKV);
		SQLQuery query = this.getSession().createSQLQuery(sql);
		this.setQueryParams(query, KV);
		query.setFirstResult(start).setMaxResults(limit);
		@SuppressWarnings("unchecked")
		List<N> list = query.list();
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.base.dao.BaseDao#size(java.lang.String, java.util.Map)
	 */
	@Override
	public long size(String sql, Map<String, Object> KV) {
		SQLQuery query = this.getSession().createSQLQuery(sql);
		this.setQueryParams(query, KV);
		return (long) query.uniqueResult();
	}
	
	
	private String setHQLParams(String hql,Map<String, Object>KV){
		if(!KV.isEmpty()){
			hql += " where ";
			Set<String> keys = KV.keySet();
			for(String key:keys){
				hql += "e."+key+"=:"+key+" and ";
			}
			int index = hql.lastIndexOf("and");
			hql = hql.substring(0, index);
		}
		return hql;
	}
	
	private void setQueryParams(Query query,Map<String, Object>KV){
		if(!KV.isEmpty()){
			Set<String> keys = KV.keySet();
			for(String key:keys){
				query.setParameter(key, KV.get(key));
			}
		}
	}
	
	private String setQuerySort(String hql,Map<String, Boolean>SKV){
		if(!SKV.isEmpty()){
			hql += " order by ";
			Set<String> keys = SKV.keySet();
			for(String key:keys){
				hql += " e."+key;
				if(SKV.get(key)){
					hql += "asc ,";
				}else{
					hql += "desc ,";
				}
			}
		}
		int index = hql.lastIndexOf(",");
		hql = hql.substring(0, index);
		return hql;
	}
}
