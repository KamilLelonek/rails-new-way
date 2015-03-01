# Domain concept

![](https://www.lucidchart.com/publicSegments/view/54f39751-4d0c-431f-a2f1-34cb0a004554/image.png)

## Idea

The application lets us make an offer requests for juices for some particular happening. It's not an order, thus offer requests contain only products, which are related to categories, but not to the jucies themselves.

In case of any further changes in juices, categories or deliveries, offer requests are stored as a JSON read model.

## Use case

**User can perform the following actions:**

- Make an offer request
- Browse categories
- Get all juices from a category
- Display offer requests

## Aggregates

**Our domain consists of the following elements:**

1. **Offer request** (aggregate root)
2. Delivery option (entity)
3. Delivery type (value object)
4. Delivery frequency (value object)
5. Offer request product (entity)
6. **Juice** (aggregate root)
7. Juice category (entity)
9. Ingredient (value object)