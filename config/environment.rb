#encoding: utf-8
# Load the rails application
require File.expand_path('../application', __FILE__)
require File.expand_path('app/controllers/FourGeoDataProvider.rb')
# Initialize the rails application
Bid::Application.initialize!


BRANCHES = [
	{:name=>"Асино", :branch_id=>697719670, :town_id=>697718532},
	{:name=>"Вологда",	:branch_id=>170829074, :town_id=>19563302},
	{:name=>"Воронеж",	:branch_id=>155436057, :town_id=>154716846},
	{:name=>"Кемерово",	:branch_id=>131072, :town_id=>6651905},
	{:name=>"Новокузнецк",	:branch_id=>1, :town_id=>3},
	{:name=>"Котлас",	:branch_id=>214437510, :town_id=>214436550},
	{:name=>"Красноярск",	:branch_id=>196608, :town_id=>17334273},
	{:name=>"Нижневартовск",	:branch_id=>327680, :town_id=>75595776},
	{:name=>"Новомосковск",	:branch_id=>554209061, :town_id=>267012509},
	{:name=>"Оренбургская область, Восток",	:branch_id=>347441381, :town_id=>347438364},
	{:name=>"Оренбургская область, Центр",	:branch_id=>347441687, :town_id=>347440401},
	{:name=>"Ростов-на-Дону",	:branch_id=>294912, :town_id=>69959681},
	{:name=>"Сокол",	:branch_id=>265159113, :town_id=>264005528},
	{:name=>"Сургут",	:branch_id=>229376, :town_id=>69828609},
	{:name=>"Тула",	:branch_id=>246846074, :town_id=>239469795},
	{:name=>"Тюмень",	:branch_id=>445340137, :town_id=>445338470},
	{:name=>"Удмуртия",	:branch_id=>149532987, :town_id=>149532896},
	{:name=>"Ханты-Мансийск",	:branch_id=>163840, :town_id=>14942209},
	{:name=>"Череповец",	:branch_id=>178181256, :town_id=>178138031}
]
DATA_PROVIDER = FourGeoDataProvider.new