# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Profile, :type => :model do
  describe 'validation' do
    describe "primeiro nome" do
      it "aceitar 0 caracteres" do
        profile = FactoryGirl.build(:profile, :first_name => "")
        expect(profile).to be_valid
      end

      it "aceitar 1 caracteres" do
        profile = FactoryGirl.build(:profile, :first_name => "a")
        expect(profile).to be_valid
      end

      it "aceitar 32 caracteres" do
        profile = FactoryGirl.build(:profile, :first_name => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(profile).to be_valid
      end

      it "recusar acima de 32 caracteres" do
        profile = FactoryGirl.build(:profile, :first_name => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(profile).not_to be_valid
      end

      it "remover espaços em branco" do
        profile = FactoryGirl.build(:profile, :first_name => " Jose ")
        expect(profile).to be_valid
        expect(profile.first_name).to eq("Jose")
      end
    end

    describe "ultimo nome" do
      it "aceitar 0 caracteres" do
        profile = FactoryGirl.build(:profile, :last_name => "")
        expect(profile).to be_valid
      end

      it "aceitar 1 caracteres" do
        profile = FactoryGirl.build(:profile, :last_name => "a")
        expect(profile).to be_valid
      end

      it "aceitar 32 caracteres" do
        profile = FactoryGirl.build(:profile, :last_name => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(profile).to be_valid
      end

      it "recusar acima de 32 caracteres" do
        profile = FactoryGirl.build(:profile, :last_name => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        expect(profile).not_to be_valid
      end

      it "remover espaços em branco" do
        profile = FactoryGirl.build(:profile, :last_name => " Jose ")
        expect(profile).to be_valid
        expect(profile.first_name).to eq("Jose")
      end
    end

    describe "nome completo" do
      it "gerar nome completo" do
        profile = FactoryGirl.build(:person).profile
        profile.first_name = "Jose"
        profile.last_name = "Maria"
        profile.save
        expect(profile.full_name).to eq("Jose Maria")
      end
    end
  end
end
