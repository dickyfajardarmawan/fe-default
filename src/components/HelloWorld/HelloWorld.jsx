import React, { useState, useEffect } from 'react'
import { FormattedMessage, useFormatMessage } from "MainApp/IntlProviderWrapper";
import { XCircleFill, ChevronDoubleLeft, ChevronDoubleRight, ChevronLeft, ChevronRight, Trash, Plus, Diagram3, PencilSquare, Search } from 'react-bootstrap-icons';
import { getLang, urlBe, header, JwtNotValid } from 'MainApp/Helpers'
import axios from "axios";
import { openModalNotif, modalSuccessTrue, setMsgModal, modalSuccessFalse } from 'MainApp/GlobalSlice'
import Modal from 'MainApp/Modal'

export const HelloWorld = () => {
    
    return (
        <div className="flex flex-col items-center px-6 py-10 mx-auto">
            <div className="w-full bg-white rounded-lg max-w-5xl border border-blue-300">
                <div className='bg-blue-900 text-white p-3 rounded-t-lg pl-5'>
                    <FormattedMessage id="label.hello" />
                </div>
                <div className="p-5 text-xs">
                    <h1>Hello World</h1>
                </div>
            </div>
        </div>
    )
}

export default HelloWorld