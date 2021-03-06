/*
 * This library is part of OpenCms -
 * the Open Source Content Management System
 *
 * Copyright (c) Alkacon Software GmbH (http://www.alkacon.com)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * For further information about Alkacon Software, please see the
 * company website: http://www.alkacon.com
 *
 * For further information about OpenCms, please see the
 * project website: http://www.opencms.org
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

package com.alkacon.bootstrap.search.client;

/**
 * Customization.<p>
 */
public interface I_CmsSearchConstants {

    /** Node within the json result. */
    String NODE_DOCS = "docs";

    /** Node within the json result. */
    String NODE_FACETFIELDS = "facet_fields";

    /** Node within the json result. */
    String NODE_FACETS = "facet_counts";

    /** Node within the json result. */
    String NODE_HIGHLIGHTING = "highlighting";

    /** Node within the json result. */
    String NODE_LINK = "link";

    /** Node within the json result. */
    String NODE_LOCALE = "locale";

    /** The node containing the total count of found documents. */
    String NODE_NUM_FOUND = "numFound";

    /** Node within the json result. */
    String NODE_PATH = "path";

    /** Node within the json result. */
    String NODE_RESPONSE = "response";

    /** Node within the json result. */
    String NODE_TITLE = "title";
}