// LawsController.java

package com.klu.controllers;

import com.klu.models.Law;
import com.klu.repository.LawRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class LawsController {

    @Autowired
    private LawRepository lawRepository;

    @GetMapping("/laws")
    public String getLaws(@RequestParam(required = false) String search, 
                          @RequestParam(required = false) String filter, 
                          Model model) {
        List<Law> laws = lawRepository.findAll();

        if (search != null && !search.isEmpty()) {
            laws = laws.stream()
                       .filter(law -> law.getName().toLowerCase().contains(search.toLowerCase()) || 
                                      law.getDescription().toLowerCase().contains(search.toLowerCase()))
                       .collect(Collectors.toList());
        }

        if (filter != null && !filter.isEmpty()) {
            laws = lawRepository.findByCategory(filter);
        }

        model.addAttribute("laws", laws);
        model.addAttribute("isAdmin", false); // Set this to true if the user is an admin
        return "laws";
    }

    @GetMapping("/laws/{url}")
    public String getLawDetails(@PathVariable String url, Model model) {
        Law law = lawRepository.findByUrl(url);

        if (law == null) {
            // Handle the case where the law is not found
            return "error"; // You can create an error page if needed
        }

        model.addAttribute("law", law);
        return "law-details";
    }

    @PostMapping("/laws")
    @ResponseBody
    public Law addLaw(@RequestBody Law law) {
        return lawRepository.save(law);
    }

    @PutMapping("/laws/{id}")
    @ResponseBody
    public Law updateLaw(@PathVariable Long id, @RequestBody Law law) {
        law.setId(id);
        return lawRepository.save(law);
    }

    @DeleteMapping("/laws/{id}")
    @ResponseBody
    public void deleteLaw(@PathVariable Long id) {
        lawRepository.deleteById(id);
    }

    @GetMapping("/admin/laws")
    public String getAdminLaws(Model model) {
        List<Law> laws = lawRepository.findAll();
        model.addAttribute("laws", laws);
        model.addAttribute("isAdmin", true); // Set this to true for admin pages
        return "LawAdmin"; // Ensure this matches the JSP file name
    }
}