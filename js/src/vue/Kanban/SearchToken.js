/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

export default class SearchToken {
    constructor(term, tag, exclusion, position, raw, prefix = null) {
        this.term = term;
        this.tag = tag || null; // Prevent undefined value
        this.exclusion = exclusion;
        this.position = position;
        this.raw = raw;
        this.prefix = prefix;
    }
}
