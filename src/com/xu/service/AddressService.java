package com.xu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.xu.dao.AddressMapper;
import com.xu.dao.ShopperMapper;
import com.xu.model.Address;
import com.xu.model.Shopper;
import com.xu.utils.BeanUtil;
import com.xu.utils.PagedResult;

@Service
@Transactional
public class AddressService {
	@Resource
	private AddressMapper addressMapper;

	public PagedResult<Address> getAllAddressByPage(Integer shopperId, Integer pageNumber, Integer pageSize) {
		// 1. ���÷�ҳ���
		PageHelper.startPage(pageNumber, pageSize);
		// 2. ��ѯ���ݿ⣬��ȡ����
		List<Address> address = addressMapper.getAllAddress(shopperId);
		// 3. ͨ����ҳ��������ط�ҳ����
		BeanUtil.toPagedResult(address);
		return BeanUtil.toPagedResult(address);
	}

	public void addAddress(Address address) {
		addressMapper.addAddress(address);
	}

	public Address findAddressById(String addressId) {
		Address address=addressMapper.findAddressById(addressId);
		return address;
	}

	public void modifyAddress(Address address) {
		addressMapper.modifyAddress(address);
		
	}

	public void deleteAddress(Address address) {
		addressMapper.deleteAddressById(address);
		
	}

	public List<Address> findAllAddresByShopperId(Integer shopperId) {
		List<Address> address = addressMapper.getAllAddress(shopperId);
		return address;
	}
}
