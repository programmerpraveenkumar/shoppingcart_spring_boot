package com.youtube.ecommerce.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.youtube.ecommerce.model.Category;

public interface CategoryRepo  extends JpaRepository<Category, Long> {

}
