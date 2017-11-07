package org.zico.web;



import javax.inject.Inject;
import javax.sql.DataSource;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class InjectTest {

	
	@Inject
	DataSource ds;
	
	
	@Test
	public void testSayHello() throws Exception {
		System.out.println(ds.getConnection());
	}
	
	

}
