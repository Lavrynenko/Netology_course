#import requests
import requests
import re
import urllib

#Открываем файл со ссылкой на нужную страницу
f = open('link.txt','r', encoding='utf8')
link = f.readline()
#print(link)

#Получаем ответ страницы и выводим исходный код страницы
response = requests.get(link)
#print (response.content)

#Сохраняем исходный код страницы во временный файл
f = open('temp.txt', 'wb')
text_for_file = response.content
f.write(text_for_file)
f.close()
print('Исходный код страницы сохранен в файл')

#Начинаем парсить по регулярному выражению
# regxp = '(?<=photoUrl&quot;:&quot;)https://cdn\.inmyroom\.ru/uploads/photo[\w\W]*?\.jpg(?=&quot;}"\ data-component)'
regxp = '(?<=photoUrl&quot;:&quot;)(https:\/\/cdn\.inmyroom\.ru\/uploads\/photo.*?\.jpg)(?=&quot;}\"><noscript)'
pars = 'quot;Венеция&quot;" data-component="lazyPhoto" data-src="https://cdn.inmyroom.ru/uploads/photo/file/23/23f8\
/product_teaser_23f8ff3f-ec21-4764-9505-8e89ba7e17d4.jpg" src="/1x1.gif" /><div class="c-product-preview_badges">\
<div class="c-product-preview-badge c-product-preview-badge__stock">10 и более шт.</div></div></a><div class="c\
-product-preview_price"><div class="_current __no-badge"><span itemprop="price">16 074</span><meta content="RUB"\
itemprop="priceCurrency" /></div></div><a class="c-product-preview_title js-gtm-product-click" href="/products/\
485574?utm_campaign=NativeWidget&amp;utm_content=15475&amp;utm_medium=Desktop&amp;utm_source=Articles&amp;utm_\
term=Regular" target="_blank">Настенное Зеркало с подсветкой &quot;Венеция&quot;</a><div class="c-btn-favorite js\
-gtm-btn-favorite" data-component="btnFavorite" data-needs-auth="" data-options="{&quot;objectType&quot;:&quot\
;Product&quot;,&quot;objectId&quot;:485574}"></div><div class="c-product-preview_actions"><div class="btn-buy js\
-gtm-product-add-to-cart" data-component="btnBuyProduct" data-options="{&quot;action&quot;:&quot;ADD_TO_CART&quot;,\
&quot;offerState&quot;:&quot;ready-to-ship&quot;,&quot;productId&quot;:485574}">Купить</div><div class="btn-add-to-\
collection js-gtm-product-add-to-collection" data-component="btnAddToCollection" data-needs-auth="" data-options="\
{&quot;url&quot;:&quot;https://www.inmyroom.ru/products/485574/collector&quot;,&quot;count&quot;:null,&quot;type&quot\
;:&quot;Product&quot;,&quot;id&quot;:485574}"><span>Сохранить</span></div></div></div></div>\
<h2 class="me-title me-title__variant_h2">8. Прячем стиральную машину</h2><div class="article-text"><p>Зачем \
искать для стиральной машины место у стены, если можно вписать ее в нишу и забыть о том, что она постоянно мешала \
вашим передвижениям?</p></div><div class="gallery c-gallery__single" data-component="gallery"><ul class="slides">\
<li data-el="c-Gallery/slide"><div class="gallery_image c-photo-map" data-component="photoMap" data-options="{&quot\
;digest&quot;:&quot;cef628a82d&quot;,&quot;photoUrl&quot;:&quot;https://cdn.inmyroom.ru/uploads/photo/file/01/014\
c/original_014cb934-3021-4be9-a311-3b1fcece0452.jpg&quot;}"><noscript><a href="https://www.inmyroom.ru/photos/show/\
1964112"><img alt="Дизайн: Cubiq Studio" src="https://cdn.inmyroom.ru/uploads/photo/file/01/014c/main_post_014cb934-3\
021-4be9-a311-3b1fcece0452.jpg" /></a></noscript><img alt="Дизайн: Cubiq Studio" data-el="c-Gallery/slide/image" dat\
a-src="https://cdn.inmyroom.ru/uploads/photo/file/01/014c/main_post_014cb934-3021-4be9-a311-3b1fcece0452.jpg" src="/1x\
1.gif" style="height: 827px;background-color: #AFA9AB" /><div class="gallery_actions"><div class="btn-add-to-col\
lection ga-collect_photo_post" data-component="btnAddToCollection" data-needs-auth="" data-options="{&quot;url&quo\
t;:&quot;/photos/1964112/collector&quot;,&quot;type&quot;:&quot;Photo&quot;,&quot;id&quot;:1964112}">Сохранить</div\
><a class="btn-send ga-send_photo_post" href="mailto:вашдруг@email.com?subject=Фотография&amp;body=%D0%9C%D0%BD%D0%\
B5%20%D0%BF%D0%BE%D0%BD%D1%80%D0%B0%D0%B2%D0%B8%D0%BB%D0%B0%D1%81%D1%8C%20%D1%84%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0\
%D1%84%D0%B8%D1%8F%20%D0%BD%D0%B0%20inmyroom.ru%20-%20https://www.inmyroom.ru/photos/show/1964112"></a><div class="\
btn-print btn-shot ga-print_photo_post" data-el="c-Gallery/slide/print"></div></div><a class="gallery_image_open" \
data-el="c-Gallery/slide/open" data-photo-id="1964112" href="https://www.inmyroom.ru/photos/show/1964112"><span>На в\
есь экран</span></a></div><a class="caption" href="https://www.inmyroom.ru/posts/13243-studiya-nedeli-28-kvadratnyh\
-metrov-dlya-komfortnoj-zhizni" target="_blank">Дизайн: Cubiq Studio</a></li></ul></div><div class="c-gallery-products-\
ad is-hidden" data-dom-component="c-GalleryProductsAd" data-props="{&quot;digest&quot;:&quot;cef628a82d&quot;,&quot;s\
tyle&quot;:&quot;standart&quot;}"><div class="c-gallery-products-ad_wrapper" data-el="c-GalleryProductsAd/wrapper"><div\
 class="c-gallery-products-ad_title">Товары для интерьера</div><div class="c-gallery-products-ad_close" data-el="\
 c-GalleryProductsAd/close">Скрыть товары</div><div class="c-gallery-products-ad_slides" data-el="c-GalleryProductsAd/\
 slides"></div></div></div><h2 class="me-title me-title__variant_h2">9. Заказываем сдвижную дверь</h2><div class="a\
 rticle-text"><p>Такой вариант позволит сэкономить пространство. А матовая дверь, как на фото, еще и сделает ванную\
  более светлой.</p></div><div class="gallery c-gallery__single" data-component="gallery"><ul class="slides">'

# result = re.findall(regxp, pars)
# print (result)

# result = re.findall('cdn', pars)
result = re.findall(regxp, pars)
print (result)