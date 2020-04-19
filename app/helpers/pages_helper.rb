module PagesHelper
  def map_helper
    map_address = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d50470.07476441353!2d
                  -122.47261935619802!3d37.75769481909687!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1
                  !3m3!1m2!1s0x80859a6d00690021%3A0x4a501367f076adff!2z0KHQsNC9LdCk0YDQsNC90YbQuN
                  GB0LrQviwg0JrQsNC70LjRhNC-0YDQvdC40Y8sINCh0KjQkA!5e0!3m2!1sru!2sru!4v1574408521
                  488!5m2!1sru!2sru'

    "<iframe src='#{map_address}' width='450' height='450' frameborder='0'
    style='border:0;' allowfullscreen=''></iframe>".html_safe
  end
end
