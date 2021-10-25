User.delete_all
Picture.delete_all
Location.delete_all

full_path_json =  Dir.pwd + '/users.json'

puts "Importando dados"
records = JSON.parse(File.read(full_path_json))
records['results'].each do |record|
  user = User.new(
      id: record['login']['uuid'],
      gender: record['gender'],
      title_name: record['name']['title'],
      first_name: record['name']['first'],
      last_name: record['name']['last'],
      email: record['email'],
      birth_date: record['dob']['date'],
      age: record['dob']['age'],
      registered_date: record['registered']['date'],
      age_registred: record['registered']['age'],
      phone: record['phone'],
      cell: record['cell'],
      id_name: record['id']['name'],
      id_value: record['id']['value'],
      nationality: record['nat'],
      username: record['login']['username'],
      password: record['login']['password'],
      salt: record['login']['salt'],
      md5: record['login']['md5'],
      sha1: record['login']['sha1'],
      sha256: record['login']['sha256']
  )

  location = Location.new(
    street: "#{record['location']['street']['number']} #{record['location']['street']['name']}",
    city: record['location']['city'],
    state: record['location']['state'],
    postcode: record['location']['postcode'],
    latitude: record['location']['coordinates']['latitude'],
    longitude: record['location']['coordinates']['longitude'],
    timezone_offset: record['location']['timezone']['offset'],
    timezone_description: record['location']['timezone']['description'],
    user_id: record['login']['uuid']
  )

  picture = Picture.new(
    large: record['picture']['large'],
    medium: record['picture']['medium'],
    thumbnail: record['picture']['thumbnail'],
    user_id: record['login']['uuid']
  )

  user.save
  location.save
  picture.save
end

puts "Dados importados com sucesso"