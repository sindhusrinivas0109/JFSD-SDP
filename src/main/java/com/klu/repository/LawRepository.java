// LawRepository.java

package com.klu.repository;

import com.klu.models.Law;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LawRepository extends JpaRepository<Law, Long> {
    List<Law> findByCategory(String category);
    Law findByUrl(String url);
}