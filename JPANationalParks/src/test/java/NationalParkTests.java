import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.skilldistillery.nationalpark.entities.NationalPark;

class NationalParkTests {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private NationalPark np;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("NatlParkPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		np = em.find(NationalPark.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		np = null;
	}
	@Disabled
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void test_NP_mappings() {
		assertNotNull(np);
		assertEquals("Rocky Mountain", np.getName());
	}

}
