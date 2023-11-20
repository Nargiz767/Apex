import { createElement } from 'lwc';
import C2pCustomEventParameterChild from 'c/c2pCustomEventParameterChild';

describe('c-c2-p-custom-event-parameter-child', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-c2-p-custom-event-parameter-child', {
            is: C2pCustomEventParameterChild
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});