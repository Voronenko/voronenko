#!/usr/bin/python
import jinja2
import json

templateLoader = jinja2.FileSystemLoader(searchpath="./templates")
templateEnv = jinja2.Environment(loader=templateLoader)

TEMPLATES = [
     "cv-detail-about.html",
     "cv-detail-skills.html",
     "cv-detail-interests.html",
     "cv-detail-references.html",
     "cv-detail-education.html"
     ]

resume_obj = None

with open('./resume.json') as json_file:
      resume_obj = json.load(json_file)

for template in TEMPLATES:
    template_instance = templateEnv.get_template("{}.j2".format(template))
    template_rendered = template_instance.render(resume=resume_obj)
    with open("./templates/{}".format(template), "wb") as f:
      f.write(template_rendered)

