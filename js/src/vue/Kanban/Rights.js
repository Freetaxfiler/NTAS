/**
 * Naipunya Enterprise Service Management
 * Copyright (C) 2026 Naipunya Tax and Accounting Solutions Pvt.Ltd.
 */

/**
 * Kanban rights structure
 * @since 10.0.0
 */
export class Rights {
    constructor(rights) {
        /**
         * If true, then a button will be added to each column to allow new items to be added.
         * When an item is added, a request is made via AJAX to create the item in the DB.
         * Permissions are re-checked server-side during this request.
         * Users will still be limited by the {@link create_card_limited_columns} right both client-side and server-side.
         * @since 9.5.0
         * @since 10.0.0 Moved to new rights class
         * @type {boolean}
         */
        this.create_item = rights['create_item'] || false;

        /**
         * If true, then a button will be added to each card to allow deleting them and the underlying item directly from the kanban.
         * When a card is deleted, a request is made via AJAX to delete the item in the DB.
         * Permissions are re-checked server-side during this request.
         * @since 10.0.0
         * @type {boolean}
         */
        this.delete_item = rights['delete_item'] || false;

        /**
         * If true, then a button will be added to the add column form that lets the user create a new column.
         * For Projects as an example, it would create a new project state.
         * Permissions are re-checked server-side during this request.
         * @since 9.5.0
         * @since 10.0.0 Moved to new rights class
         * @type {boolean}
         */
        this.create_column = rights['create_column'] || false;

        /**
         * Global permission for being able to modify the Kanban state/view.
         * This includes the order of cards in the columns.
         * @since 9.5.0
         * @since 10.0.0 Moved to new rights class
         * @type {boolean}
         */
        this.modify_view = rights['modify_view'] || false;

        /**
         * Limits the columns that the user can add cards to.
         * By default, it is empty which allows cards to be added to all columns.
         * If you don't want the user to add cards to any column, {@link rights.create_item} should be false.
         * @since 9.5.0
         * @since 10.0.0 Moved to new rights class
         * @type {Array}
         */
        this.create_card_limited_columns = rights['create_card_limited_columns'] || [];

        /**
         * Global right for ordering cards.
         * @since 9.5.0
         * @since 10.0.0 Moved to new rights class
         * @type {boolean}
         */
        this.order_card = rights['order_card'] || false;
    }

    /** @see this.create_item */
    canCreateItem() {
        return this.create_item;
    }

    /** @see this.delete_item */
    canDeleteItem() {
        return this.delete_item;
    }

    /** @see this.create_column */
    canCreateColumn() {
        return this.create_column;
    }

    /** @see this.modify_view */
    canModifyView() {
        return this.modify_view;
    }

    /** @see this.order_card */
    canOrderCard() {
        return this.order_card;
    }

    /** @see this.create_card_limited_columns */
    getAllowedColumnsForNewCards() {
        return this.create_card_limited_columns;
    }
}
