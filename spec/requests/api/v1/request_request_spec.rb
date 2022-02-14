require 'rails_helper'

describe 'Request API' do
  before(:each) do
    @community_1 = Community.create!(name: "Whirlwind Apartments")

    @user_1 = User.create!(name: "Tonya Harding", email: "tonya@fake.com", username: "skate4life", community_id: @community_1.id)
    @user_2 = User.create!(name: "Luka Doncic", email: "luka@fake.com", username: "lukathaprince", community_id: @community_1.id)
    @user_3 = User.create!(name: "Mikaela Shiffrin", email: "mikaela@fake.com", username: "skiqueen999", community_id: @community_1.id)
    @user_4 = User.create!(name: "Chloe Kim", email: "chloe@fake.com", username: "superpipeslayer34", community_id: @community_1.id)
    @user_5 = User.create!(name: "Dwight Schrute", email: "dwight@fake.com", username: "bearsbeetsbg", community_id: @community_1.id)

    @request_1 = Request.create!(name: "claw hammer", details: "I need a hammer for nothing nefarious.", item_category: "tools", status: 0, borrow_date: 'Thu, 15 Feb 2022', return_date: 'Thu, 17 Feb 2022', requested_by_id: @user_1.id, community_id: @community_1.id, lender_id: nil)
    @request_2 = Request.create!(name: "ski mask", details: "will wash and dry before return", item_category: "sporting goods", status: 1, borrow_date: '2022-02-21', return_date: '2022-02-24', requested_by_id: @user_1.id, community_id: @community_1.id, lender_id: @user_3.id)
    @request_3 = Request.create!(name: "knife", details: "butcher knife preferred", item_category: "kitchen", status: 2, borrow_date: "2022-02-17", return_date: "2022-02-17", requested_by_id: @user_2.id, community_id: @community_1.id, lender_id: @user_1.id)
  end

  it 'happy path - can get all requests' do
    get "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests"

    expect(response).to be_successful

    requests = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(requests.count).to eq(3)

    requests.each do |request|
      expect(request[:attributes]).to have_key(:name)
      expect(request[:attributes][:name]).to be_a(String)
      expect(request[:attributes]).to have_key(:details)
      expect(request[:attributes][:details]).to be_a(String)
      expect(request[:attributes]).to have_key(:status)
      expect(request[:attributes][:status]).to be_a(String)
      expect(request[:attributes]).to have_key(:borrow_date)
      expect(request[:attributes][:borrow_date]).to be_a(String)
      expect(request[:attributes]).to have_key(:return_date)
      expect(request[:attributes][:return_date]).to be_a(String)
      expect(request[:attributes]).to have_key(:requested_by_id)
      expect(request[:attributes][:requested_by_id]).to be_an(Integer)
      expect(request[:attributes]).to have_key(:lender_id)
      expect(request[:attributes]).to have_key(:community_id)
      expect(request[:attributes][:community_id]).to be_an(Integer)
    end
  end

  it "happy path - can get one request by its id" do
    get "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests/#{@request_1.id}"

    expect(response).to be_successful

    request = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(request).to be_a(Hash)
    expect(request[:attributes][:name]).to be_a(String)
    expect(request[:attributes][:community_id]).to eq(@community_1.id)
  end

  it 'sad path - sends an error code if request does not exist' do
    get "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests/10000"
    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response.status).to eq(404)
    expect(error).to eq("Request not found")
  end

  it 'happy path - can create a new request' do
    params = {name: 'kitchen sink',
              details: 'need to do dishes',
              item_category: 'kitchen',
              status: 0,
              borrow_date: "2022-02-17",
              return_date: "2022-02-18",
              requested_by_id: @user_4.id,
              community_id: @community_1.id
            }

    post "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response.status).to eq(201)

    request = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(request[:attributes][:name]).to eq("kitchen sink")
  end

  it 'sad path - sends an error code if request is not created' do
    params = {name: '',
              details: 'need to do dishes',
              item_category: 'kitchen',
              status: 0,
              borrow_date: "2022-02-17",
              return_date: "2022-02-18",
              requested_by_id: @user_4.id,
              community_id: @community_1.id
            }
    post "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests", headers: {"Content-Type": "application/json"}, params: params.to_json

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response.status).to eq(400)
    expect(error).to eq("There was an error creating this request")
  end

  it 'can update a request' do
    request_params = {
                      name: 'claw hammer',
                      details: 'I need a hammer for nothing nefarious.',
                      item_category: 'tools',
                      status: 0,
                      borrow_date: "2022-02-15",
                      return_date: "2022-02-16",
                      requested_by_id: @user_1.id,
                      community_id: @community_1.id,
                      lender_id: @user_1.id
                    }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests/#{@request_1.id}", headers: header, params: JSON.generate(request_params)

    request = Request.find_by(id: @request_1.id)

    expect(response).to be_successful
    expect(request.lender_id).to eq(request_params[:lender_id])
  end

  it 'sad path - sends an error code if a request is not updated' do
    request_params = {
                      name: 'claw hammer',
                      details: '',
                      item_category: 'tools',
                      status: 0,
                      borrow_date: "2022-02-15",
                      return_date: "2022-02-16",
                      requested_by_id: @user_1.id,
                      community_id: @community_1.id,
                      lender_id: @user_5.id
                    }

    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests/#{@request_1.id}", headers: header, params: JSON.generate(request_params)

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    request = Request.find_by(id: @request_1.id)

    expect(response.status).to eq(400)
    expect(error).to eq("There was an error updating this request")
    expect(request.details).to_not eq('')
  end

  it 'can delete a request' do
    request_5 = Request.create!(name: "tent", details: "camping trip over the weekend", item_category: "sporting goods", status: 0, borrow_date: "2022-02-22", return_date: "2022-02-24", requested_by_id: @user_1.id, community_id: @community_1.id, lender_id: nil)

    expect(Request.count).to eq(4)

    delete "/api/v1/users/#{@user_1.id}/communities/#{@community_1.id}/requests/#{request_5.id}"

    expect(response).to be_successful

    expect(Request.count).to eq(3)
  end
end
