https://toster.ru/q/236162


#!/usr/bin/env python3
from urllib.request import Request, urlopen
import re,csv

import time
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


BASE_URL = 'https://kingfashion.com/ru/boys-riot-club/'



def get_html(url):
    # req = Request(url, headers={'User-Agent' : 'Mozilla/5.0'})
    # response = urlopen(req).read()
    driver = webdriver.Firefox()
    driver.get(url)
    # driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    SCROLL_PAUSE_TIME = 3

    # Get scroll height
    last_height = driver.execute_script("return document.body.scrollHeight")

    while True:
        # Scroll down to bottom
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        # Wait to load page
        time.sleep(SCROLL_PAUSE_TIME)

        # Calculate new scroll height and compare with last scroll height
        new_height = driver.execute_script("return document.body.scrollHeight")
        if new_height == last_height:
            break
        last_height = new_height
    return driver.page_source

def parse_url(html):
    soup = BeautifulSoup(html, 'html.parser')
    table = soup.find('div', {'class': 'category-products'})
    rows = table.find_all('div', {'class': 'product-info'})

    projects = []
    for row in rows:
        cols = row.find_all('h2')
        projects.append({
            'title': cols[0].text,
            'url': cols[0].a['href']

        })
    return projects

def save_url(projects,path):
    f = open('youtube_html.txt', 'w')
    # while open('youtube_html.txt', 'w') as f:
    f.write(page_source)
    f.close()
    # with open(path,'w', newline='') as csvfile:
    #     writer = csv.writer(csvfile, delimiter=';')
    #     writer.writerow(('Название', 'URL'))
    #     writer.writerows(
    #         (project['title'],project['url']) for project in projects
    #     )



def main():
    all_url = parse_url(get_html(BASE_URL))
#    save_url(all_url, 'url.csv')
    save_url()
#     # get_html(BASE_URL)
# if __name__ == '__main__':
#     main()