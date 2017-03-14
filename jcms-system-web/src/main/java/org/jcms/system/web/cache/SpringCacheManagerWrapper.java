/**
 *	Copyright [2017] [www.ramostear.com]
 *
 *	Licensed under the Apache License, Version 2.0 (the "License");<br/>
 *	you may not use this file except in compliance with the License.<br/>
 *	You may obtain a copy of the License at<br/>
 *							<br/>
 *	    http://www.apache.org/licenses/LICENSE-2.0<br/>
 *							<br/>
 *	Unless required by applicable law or agreed to in writing, software<br/>
 *	distributed under the License is distributed on an "AS IS" BASIS,<br/>
 *	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.<br/>
 *	See the License for the specific language governing permissions and<br/>
 *	limitations under the License.<br/>
 * 
 */
package org.jcms.system.web.cache;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.ehcache.Ehcache;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.CollectionUtils;
import org.springframework.cache.support.SimpleValueWrapper;

/**
 * @Author Abihu[谭朝红] - - -2017年3月14日-下午3:30:06
 * @Info http://www.abihu.org
 * @Description:
 */
public class SpringCacheManagerWrapper implements CacheManager {

	private org.springframework.cache.CacheManager cachemanager;
	
	/**
	 * @param cachemaanger the cachemaanger to set
	 */
	public void setCachemanager(org.springframework.cache.CacheManager cachemanager) {
		this.cachemanager = cachemanager;
	}
	/* (non-Javadoc)
	 * @see org.apache.shiro.cache.CacheManager#getCache(java.lang.String)
	 */
	@Override
	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		org.springframework.cache.Cache springCache = cachemanager.getCache(name);
		return new SpringCacheWrapper(springCache);
	}
	static class SpringCacheWrapper implements Cache{
		private org.springframework.cache.Cache springCache;
		SpringCacheWrapper(org.springframework.cache.Cache springCache){
			this.springCache = springCache;
		}
		/* (non-Javadoc)
		 * @see org.apache.shiro.cache.Cache#clear()
		 */
		@Override
		public void clear() throws CacheException {
			springCache.clear();
		}
		/* (non-Javadoc)
		 * @see org.apache.shiro.cache.Cache#get(java.lang.Object)
		 */
		@Override
		public Object get(Object key) throws CacheException {
			Object value = springCache.get(key);
			if(value instanceof SimpleValueWrapper){
				return ((SimpleValueWrapper)value).get();
			}
			return value;
		}
		/* (non-Javadoc)
		 * @see org.apache.shiro.cache.Cache#keys()
		 */
		@Override
		public Set keys() {
			if(springCache.getNativeCache() instanceof Ehcache){
				Ehcache ehcache = (Ehcache)springCache.getNativeCache();
				return new HashSet(ehcache.getKeys());
			}
			throw new UnsupportedOperationException("invoke spring cache abstract size method not supported");
		}
		/* (non-Javadoc)
		 * @see org.apache.shiro.cache.Cache#put(java.lang.Object, java.lang.Object)
		 */
		@Override
		public Object put(Object key, Object value) throws CacheException {
			springCache.put(key, value);
			return value;
		}
		/* (non-Javadoc)
		 * @see org.apache.shiro.cache.Cache#remove(java.lang.Object)
		 */
		@Override
		public Object remove(Object key) throws CacheException {
			springCache.evict(key);
			return null;
		}
		/* (non-Javadoc)
		 * @see org.apache.shiro.cache.Cache#size()
		 */
		@Override
		public int size() {
			if(springCache.getNativeCache() instanceof Ehcache){
				Ehcache ehcache = (Ehcache)springCache.getNativeCache();
				return ehcache.getSize();
			}
			throw new UnsupportedOperationException("invoke spring cache abstract size method not supported");
		}

		/* (non-Javadoc)
		 * @see org.apache.shiro.cache.Cache#values()
		 */
		@Override
		public Collection values() {
			if(springCache.getNativeCache() instanceof Ehcache){
				Ehcache ehcache = (Ehcache) springCache.getNativeCache();
				List keys = ehcache.getKeys();
				if(!CollectionUtils.isEmpty(keys)){
					List values = new ArrayList(keys.size());
					for(Object key:keys){
						Object value = get(key);
						if(value!=null){
							values.add(value);
							}
					}
					return Collections.unmodifiableList(values);
				}else{
					return Collections.emptyList();
				}
			}
			throw new UnsupportedOperationException("invoke spring cache abstract size method not supported");
		}
	}
}
