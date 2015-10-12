// Copyright (C) 2014, 2015 BMW Group
// Author: Lutz Bichler (lutz.bichler@bmw.de)
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
package org.genivi.commonapi.someip.generator

import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FField
import org.franca.core.franca.FStructType
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement
import org.franca.core.franca.FUnionType
import org.genivi.commonapi.someip.deployment.PropertyAccessor

class FrancaSomeIPDeploymentAccessorHelper {

    static Integer SOMEIP_DEFAULT_MIN_LENGTH = 0
    static Integer SOMEIP_DEFAULT_MAX_LENGTH = 0
    static Integer SOMEIP_DEFAULT_LENGTH_WIDTH = 4
    
    static Integer SOMEIP_DEFAULT_UNION_TYPE_WIDTH = 4
    static boolean SOMEIP_DEFAULT_UNION_DEFAULT_ORDER = true
    
    static Integer SOMEIP_DEFAULT_ENUM_BASE_TYPE = 4
    
    static PropertyAccessor.SomeIpStringEncoding SOMEIP_DEFAULT_STRING_ENCODING 
        = PropertyAccessor.SomeIpStringEncoding.utf8
    
    // Helper methods to get a specific deployment value
    def Integer getSomeIpArrayMinLengthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrArrayMinLength(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgArrayMinLength(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer minLength = _accessor.getSomeIpStructArrayMinLength(_obj)
            if (minLength == null)
                minLength = _accessor.getSomeIpUnionArrayMinLength(_obj)
            return minLength
        }

        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionArrayMinLength(_obj)
        }

        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpArrayMinLength(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_MIN_LENGTH
            }
        }
                
        return _accessor.getSomeIpArrayMinLength(_obj)
    }
    
    def Integer getSomeIpArrayMaxLengthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrArrayMaxLength(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgArrayMaxLength(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer maxLength = _accessor.getSomeIpStructArrayMaxLength(_obj)
            if (maxLength == null)
                maxLength = _accessor.getSomeIpUnionArrayMaxLength(_obj)
            return maxLength
        }

        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionArrayMaxLength(_obj)
        }

        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpArrayMaxLength(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_MAX_LENGTH
            }
        }
                
        return _accessor.getSomeIpArrayMaxLength(_obj)
    }

    def Integer getSomeIpArrayLengthWidthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrArrayLengthWidth(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgArrayLengthWidth(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer lengthWidth = _accessor.getSomeIpStructArrayLengthWidth(_obj)
            if (lengthWidth == null)
                lengthWidth = _accessor.getSomeIpUnionArrayLengthWidth(_obj)
            return lengthWidth
        }

        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionArrayLengthWidth(_obj)
        }
        
        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpArrayLengthWidth(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_LENGTH_WIDTH
            }
        }
                
        return _accessor.getSomeIpArrayLengthWidth(_obj)
    }

    def Integer getSomeIpUnionLengthWidthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrUnionLengthWidth(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgUnionLengthWidth(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer lengthWidth = _accessor.getSomeIpStructUnionLengthWidth(_obj)
            if (lengthWidth == null)
                lengthWidth = _accessor.getSomeIpUnionUnionLengthWidth(_obj)
            return lengthWidth
        }

        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionUnionLengthWidth(_obj)
        }
        
        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpUnionLengthWidth(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_LENGTH_WIDTH
            }
        }
        
        return _accessor.getSomeIpUnionLengthWidth(_obj)
    }

    def Integer getSomeIpUnionTypeWidthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrUnionTypeWidth(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgUnionTypeWidth(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer typeWidth = _accessor.getSomeIpStructUnionTypeWidth(_obj)
            if (typeWidth == null)
                typeWidth = _accessor.getSomeIpUnionUnionTypeWidth(_obj)
            return typeWidth
        }
        
        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionUnionTypeWidth(_obj)
        }
        
        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpUnionTypeWidth(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_LENGTH_WIDTH
            }
        }
                
        return _accessor.getSomeIpUnionTypeWidth(_obj)
    }

    def Boolean getSomeIpUnionDefaultOrderHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrUnionDefaultOrder(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgUnionDefaultOrder(_obj)
        }
        
        if (_obj instanceof FField) {
            var Boolean defaultOrder = _accessor.getSomeIpStructUnionDefaultOrder(_obj)
            if (defaultOrder == null)
                defaultOrder = _accessor.getSomeIpUnionUnionDefaultOrder(_obj)
            return defaultOrder
        }
        
        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionUnionDefaultOrder(_obj)
        }

        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpUnionDefaultOrder(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_UNION_DEFAULT_ORDER
            }
        }
                
        return _accessor.getSomeIpUnionDefaultOrder(_obj)
    }

    def Integer getSomeIpUnionMaxLengthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrUnionMaxLength(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgUnionMaxLength(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer maxLength = _accessor.getSomeIpStructUnionMaxLength(_obj)
            if (maxLength == null)
                maxLength = _accessor.getSomeIpUnionUnionMaxLength(_obj)
            return maxLength
        }
        
        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionUnionMaxLength(_obj)
        }

        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpUnionMaxLength(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_MAX_LENGTH
            }
        }
                
        return _accessor.getSomeIpUnionMaxLength(_obj)
    }

    def Integer getSomeIpStructLengthWidthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrStructLengthWidth(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgStructLengthWidth(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer lengthWidth = _accessor.getSomeIpStructLengthWidth(_obj)
            if (lengthWidth == null)
                lengthWidth = _accessor.getSomeIpUnionStructLengthWidth(_obj)
            return lengthWidth
        }

        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionStructLengthWidth(_obj)
        }

        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                return _accessor.getSomeIpStructLengthWidth(_obj.actualType.derived)
            } else {
                return SOMEIP_DEFAULT_LENGTH_WIDTH
            }
        }
                
        return _accessor.getSomeIpStructLengthWidth(_obj)
    }

    def getSomeIpEnumWidthHelper(PropertyAccessor _accessor, EObject _obj) {
        if (_obj instanceof FAttribute) {
            return _accessor.getSomeIpAttrEnumWidth(_obj)
        }
        
        if (_obj instanceof FArgument) {
            return _accessor.getSomeIpArgEnumWidth(_obj)
        }
        
        if (_obj instanceof FField) {
            var Integer enumBaseType = _accessor.getSomeIpStructEnumWidth(_obj)
            if (enumBaseType == null)
                enumBaseType = _accessor.getSomeIpUnionEnumWidth(_obj)
            return enumBaseType
        }

        if (_obj.eContainer() instanceof FUnionType) {
            return _accessor.getSomeIpUnionEnumWidth(_obj)
        }
        
        if (_obj instanceof FEnumerationType) {
            return _accessor.getSomeIpEnumWidth(_obj)
        }

        if (_obj instanceof FTypeDef) {
            if (_obj.actualType.derived != null) {
                val FType derived = _obj.actualType.derived
                if (derived instanceof FEnumerationType) {
                    return _accessor.getSomeIpEnumWidth(derived)
                }
            } 
            return SOMEIP_DEFAULT_ENUM_BASE_TYPE
        }
        
        return null
    }

    // Helper to check whether the deployment differs from the default deployment
    def boolean hasSomeIpArrayMinLength(PropertyAccessor _accessor, EObject _object) {
        val Integer minLength = _accessor.getSomeIpArrayMinLengthHelper(_object)
        return (minLength != null && minLength != SOMEIP_DEFAULT_MIN_LENGTH)
    }
    
    def boolean hasSomeIpArrayMaxLength(PropertyAccessor _accessor, EObject _object) {
        val Integer maxLength = _accessor.getSomeIpArrayMaxLengthHelper(_object)
        return (maxLength != null && maxLength != SOMEIP_DEFAULT_MAX_LENGTH)
    }
    
    def boolean hasSomeIpArrayLengthWidth(PropertyAccessor _accessor, EObject _object) {
        val Integer lengthWidth = _accessor.getSomeIpArrayLengthWidthHelper(_object)
        return (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH)
    }
    
    def boolean hasSomeIpStringLength(PropertyAccessor _accessor, EObject _object) {
        val Integer length = _accessor.getSomeIpStringLength(_object)
        return (length != null && length != SOMEIP_DEFAULT_MIN_LENGTH)
    }

    def boolean hasSomeIpStringLengthWidth(PropertyAccessor _accessor, EObject _object) {
        val Integer lengthWidth =_accessor.getSomeIpStringLengthWidth(_object)
        return (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH)
    }
    
    def boolean hasSomeIpStructLengthWidht(PropertyAccessor _accessor, EObject _object) {
        val Integer lengthWidth = _accessor.getSomeIpStructLengthWidthHelper(_object)
        return (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH)
    }
    
    def boolean hasSomeIpStringEncoding(PropertyAccessor _accessor, EObject _object) {
        val PropertyAccessor.SomeIpStringEncoding encoding
            = _accessor.getSomeIpStringEncoding(_object)
        return (encoding != null && encoding != SOMEIP_DEFAULT_STRING_ENCODING)
    }
    
    def boolean hasSomeIpUnionLengthWidth(PropertyAccessor _accessor, EObject _object) {
        val Integer lengthWidth = _accessor.getSomeIpUnionLengthWidthHelper(_object)
        return (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH)
    }
    
    def boolean hasSomeIpUnionTypeWidth(PropertyAccessor _accessor, EObject _object) {
        val Integer typeWidth = _accessor.getSomeIpUnionTypeWidthHelper(_object)
        return (typeWidth != null && typeWidth != SOMEIP_DEFAULT_UNION_TYPE_WIDTH)
    }

    def boolean hasSomeIpUnionDefaultOrder(PropertyAccessor _accessor, EObject _object) {
        val Boolean defaultOrder = _accessor.getSomeIpUnionDefaultOrderHelper(_object)
        return (defaultOrder != null && defaultOrder != SOMEIP_DEFAULT_UNION_DEFAULT_ORDER)
    }

    def boolean hasSomeIpUnionMaxLength(PropertyAccessor _accessor, EObject _object) {
        val Integer maxLength = _accessor.getSomeIpUnionMaxLengthHelper(_object)
        return (maxLength != null && maxLength != SOMEIP_DEFAULT_MAX_LENGTH)
    }
    
    def boolean hasSomeIpStructLengthWidth(PropertyAccessor _accessor, EObject _object) {
        val Integer lengthWidth = _accessor.getSomeIpStructLengthWidthHelper(_object)
        return (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH)
    }
    
    def boolean hasSomeIpEnumWidth(PropertyAccessor _accessor, EObject _object) {
        val Integer baseType = _accessor.getSomeIpEnumWidthHelper(_object)
        return (baseType != null && baseType != SOMEIP_DEFAULT_ENUM_BASE_TYPE)
    }    
    
    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FTypedElement _element) {
    	if (_accessor == null)
    		return false
        if (_accessor.hasSomeIpArrayMinLength(_element) ||
            _accessor.hasSomeIpArrayMaxLength(_element) ||
            _accessor.hasSomeIpArrayLengthWidth(_element) ||
            _accessor.hasSomeIpStringLength(_element) ||
            _accessor.hasSomeIpStringLengthWidth(_element) ||
            _accessor.hasSomeIpStringEncoding(_element) ||
            _accessor.hasSomeIpStructLengthWidht(_element) ||
            _accessor.hasSomeIpUnionLengthWidth(_element) ||
            _accessor.hasSomeIpUnionTypeWidth(_element) ||
            _accessor.hasSomeIpUnionDefaultOrder(_element) ||
            _accessor.hasSomeIpUnionMaxLength(_element)) {
            return true
        }
        return _accessor.hasDeployment(_element.type)
    }
    
    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FArrayType _array) {
        if (_accessor.hasSomeIpArrayMinLength(_array) ||
            _accessor.hasSomeIpArrayMaxLength(_array) ||
            _accessor.hasSomeIpArrayLengthWidth(_array)) {
            return true
        }
        
        if (_accessor.hasDeployment(_array.elementType)) {
            return true
        }
        
        return false
    }
    
    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FEnumerationType _enum) {
    	return _accessor.hasSomeIpEnumWidth(_enum)
    }
    
    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FStructType _struct) {
        if (_accessor.hasSomeIpStructLengthWidth(_struct))
            return true
            
        for (element : _struct.elements) {
            if (_accessor.hasDeployment(element)) {
                return true
            }
        }

        return false
    }
    
    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FUnionType _union) {
        if (_accessor.hasSomeIpUnionDefaultOrder(_union) ||
            _accessor.hasSomeIpUnionLengthWidth(_union) ||
            _accessor.hasSomeIpUnionTypeWidth(_union) ||
            _accessor.hasSomeIpUnionMaxLength(_union)) {
            return true
        }
        
        for (element : _union.elements) {
            if (_accessor.hasDeployment(element)) {
                return true
            }
        }

        return false
    }
    
    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FTypeDef _typeDef) {
        return _accessor.hasDeployment(_typeDef.actualType)
    }

    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FBasicTypeId _type) {
        return false
    }

    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FType _type) {
        return false;
    }
    
    def dispatch boolean hasDeployment(PropertyAccessor _accessor, FTypeRef _type) {
        if (_type.derived != null)
            return _accessor.hasDeployment(_type.derived)
 
        if (_type.predefined != null)
            return _accessor.hasDeployment(_type.predefined)
 
        return false 
    }
    
    def boolean hasSpecificDeployment(PropertyAccessor _accessor, 
                                      FTypedElement _attribute) {
        try {
            val Integer minLength = _accessor.getSomeIpArrayMinLengthHelper(_attribute)
            if (minLength != null && minLength != SOMEIP_DEFAULT_MIN_LENGTH ) {
                return true
            }                                     
        } catch (NullPointerException e) {}
        
        try {
            val Integer maxLength = _accessor.getSomeIpArrayMaxLengthHelper(_attribute)
            if (maxLength != null && maxLength != SOMEIP_DEFAULT_MAX_LENGTH ) {
                return true
            }
        } catch (NullPointerException e) {}

        try {
            val Integer lengthWidth = _accessor.getSomeIpArrayLengthWidthHelper(_attribute)
            if (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH ) {
                return true
            }  
        } catch (NullPointerException e) {}
        
        try {
            val Integer length = _accessor.getSomeIpStringLength(_attribute)
            if (length != null && length != SOMEIP_DEFAULT_MIN_LENGTH ) {
                return true
            }  
        } catch (NullPointerException e) {}
        
        try {
            val Integer lengthWidth = _accessor.getSomeIpStringLengthWidth(_attribute)
            if (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH ) {
                return true
            }  
        } catch (NullPointerException e) {}    
        
        try {
            val PropertyAccessor.SomeIpStringEncoding encoding
                = _accessor.getSomeIpStringEncoding(_attribute)
            if (encoding != null && encoding != SOMEIP_DEFAULT_STRING_ENCODING ) {
                return true
            }
        } catch (NullPointerException e) {}    

        try {
            val Integer lengthWidth = _accessor.getSomeIpStructLengthWidthHelper(_attribute)
            if (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH ) {
                return true
            }  
        } catch (NullPointerException e) {}    
        
        try {
            val Integer lengthWidth = _accessor.getSomeIpUnionLengthWidthHelper(_attribute)
            if (lengthWidth != null && lengthWidth != SOMEIP_DEFAULT_LENGTH_WIDTH ) {
                return true
            }  
        } catch (NullPointerException e) {}
        
        try {
            val Integer typeWidth = _accessor.getSomeIpUnionTypeWidthHelper(_attribute)
            if (typeWidth != null && typeWidth != SOMEIP_DEFAULT_UNION_TYPE_WIDTH ) {
                return true
            }  
        } catch (NullPointerException e) {}
        
        try {
            var Boolean defaultOrder = _accessor.getSomeIpUnionDefaultOrderHelper(_attribute)
            if (defaultOrder != null && defaultOrder != SOMEIP_DEFAULT_UNION_DEFAULT_ORDER ) {
                return true
            }
        } catch (NullPointerException e) {}
        
        try {
            val Integer maxLength = _accessor.getSomeIpUnionMaxLengthHelper(_attribute)
            if (maxLength != null && maxLength != SOMEIP_DEFAULT_MAX_LENGTH ) {
                return true
            }
        } catch (NullPointerException e) {}    

        return false
    }
}