# Exploring AI-Generated Resumes

See the full writeup: https://shomil.me/resume-generation/

Consider the phrases below.

- *Resolve advanced technology issues and maintain public computing environments; provide IT support to students and faculty over the phone and in person*
- *Developed an android app using java that supports location sharing, instant messaging between users and tracing user paths.*
- *Worked on web and MySQL for better customer experience.*
- *Deploying applications in weblogic/jboss servers, configuring data sources on the netsuite ERP financials team.*
- *Optimized load times through caching, pagination, compression and data encryption algorithms under professor chien wang’s atmospheric research.*

At first glance, these seem like ordinary bullet points from an early-stage technical resume of, perhaps, a high school or college student.

**Three out of the five points above were artificially generated. The other two were selected from real resumes. Can you identify the real statements?**

***

As a Computer Science student applying to internships, it's incredibly frustrating to apply to tens (hundreds?) of internship positions, only to be rejected – or not to hear back – from most. On the flipside, recruiters at both large and small companies recieve thousands of applications for SWE internship positions – and, as a result, are forced to skim through most resumes incredibly fast, or filter out resumes based on patterns and keywords using recruiting software.

In this project, I ask the question – if a recruiter were faced with adversarial, intelligently-generated resumes, would they be able to tell the difference between resumes written by humans and resumes written by computers?

I came across [Markovify](https://github.com/jsvine/markovify) – a simple Markov Chain sentence generator – and decided to try spoofing resume bullet points like the ones above. My training dataset was scraped from Jumpstart [aside: see [this post](https://shomil.me/explore-jumpstart/) for a small accompanying data analysis portion of this project]. After pre-processing & training on some 75,000 bullet points, I spoofed about 3,000 generated bullet points. I then spun up a quick iOS App to simulate the environment of a hypothetical recruiter (disclaimer: I have no idea what actually happens in the recruiting room, but I assume something relatively close to this sort of speed-reading happens).

Check out the finished project below! The [iOS App](https://github.com/shomilj/resume-generation-ios) also on GitHub.

<video muted controls width="40%" style="display:block; margin:0 auto; border-style: dotted; border-width: 1px; border-color: #ebeff0">
    <source src="https://shomil.me/resume-generation/recruiter.mov" type="video/mp4">
</video>
