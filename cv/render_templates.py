#!/usr/bin/python
import jinja2
import json
import datetime
from markdown import markdown


def month3(input):
    """Jan"""
    month_word = datetime.date(1900, input, 1).strftime('%b')
    return month_word


def month(input):
    """January"""
    month_word = datetime.date(1900, input, 1).strftime('%B')
    return month_word


def frommarkdown(input):
    """markdown to html"""
    return markdown(input)


templateLoader = jinja2.FileSystemLoader(searchpath="./templates")
templateEnv = jinja2.Environment(loader=templateLoader)

templateEnv.filters['month3'] = month3
templateEnv.filters['month'] = month
templateEnv.filters['frommarkdown'] = frommarkdown

TEMPLATES = [
     "cv-detail-about.html",
     "cv-detail-awards.html",
     "cv-detail-education.html",
     "cv-detail-interests.html",
     "cv-detail-publications.html",
     "cv-detail-references.html",
     "cv-detail-skills.html",
     "cv-detail-work-experience.html"
     ]

resume_obj = None

with open('./resume.json') as json_file:
      resume_obj = json.load(json_file)

for template in TEMPLATES:
    template_instance = templateEnv.get_template("{}.j2".format(template))
    template_rendered = template_instance.render(resume=resume_obj)
    with open("./templates/{}".format(template), "wb") as f:
      f.write(template_rendered.encode('utf8'))

