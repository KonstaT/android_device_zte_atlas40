/*
 * Copyright (c) 2013, Rudolf Tammekivi.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

typedef union {
	unsigned char mac_address[6];
} nv_item_type;

typedef enum {
	NV_BT_MAC_ADDRESS_I			= 447
} nv_items_enum_type;

typedef enum {
	NV_READ_F,
	NV_WRITE_F,
	NV_REPLACE_F
} nv_func_enum_type;

typedef enum {
	NV_DONE_S,		// Request completed okay
	NV_BUSY_S,		// Request is queued
	NV_BADCMD_S,	// Unrecognizable command field
	NV_FULL_S,		// The NVM is full
	NV_FAIL_S,		// Command failed, reason other than NVM was full
	NV_NOTACTIVE_S,	// Variable was not active
	NV_BADPARM_S,	// Bad parameter in command block
	NV_READONLY_S,	// Parameter is write-protected and thus read only
	NV_BADTG_S,		// Item not valid for Target
	NV_NOMEM_S,		// free memory exhausted
	NV_NOTALLOC_S	// address is not a valid allocation
} nv_stat_enum_type;

nv_stat_enum_type nv_cmd_remote(nv_func_enum_type cmd, nv_items_enum_type item,
	nv_item_type *data_ptr);
int nv_null(void);
