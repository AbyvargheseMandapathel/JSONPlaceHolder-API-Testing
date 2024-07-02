package regresapi;

import org.junit.jupiter.api.Tag;

import com.intuit.karate.junit5.Karate;

public class RegresRunner {
	
	@Karate.Test
	public Karate runTest() {
		return Karate.run("DataDriven.feature","RegresAPIdelete.feature","RegresAPIGet.feature","RegresAPIPatch.feature","RegresAPIPost.feature","RegresAPIPut.feature").relativeTo(getClass());
	}
	
//	@Karate.Test
//	public Karate runTest() {
//		return Karate.run("DataDriven.feature").relativeTo(getClass());
//	}

}
