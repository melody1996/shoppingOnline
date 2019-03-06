package com.xu.dao;

import java.util.List;

import com.xu.model.Address;

public interface AddressMapper {
	List<Address> getAllAddress(Integer shopperId);

	void addAddress(Address address);

	Address findAddressById(String addressId);

	void modifyAddress(Address address);

	void deleteAddressById(Address address);
}