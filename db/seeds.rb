# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.create(
    name: "adminuser",
    email: "admin@uc.cl",
    password: "password",
    password_confirmation: "password",
    admin: true
).save