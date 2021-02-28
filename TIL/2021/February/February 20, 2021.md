February 20, 2021 TIL

# https://js.plainenglish.io/react-vs-vue-in-2021-dda125ecd2bb scrap
React vs Vue in 2021: Which One Should You Use?
Mayank Kumar Chaudhari
Image for post
Vue and React have been among most popular and loved front-end frameworks throughout the second half of this decade. Kudos to the teams working on these frameworks, especially those working on Vue.js. Vue has done great job in competing with React and Angular, both of which are backed by big tech giants Facebook and Google respectively.

The Gist

There are many reasons for Vue’s and React’s prominence on the developer landscape, but before we dive deeper into their distinctive features, let’s briefly go over what the two share that makes them so much in demand.

Virtual DOM — instead of re-rendering the whole page as is the case with regular DOM, React and Vue update only those objects that have changed, saving the time and resources that heavy DOM manipulations otherwise consume.

Component-based UI development — Vue’s and React’s considerable libraries of components facilitate code reuse, improve developer productivity, and speed up the development process.

Focus on the view library — separate concerns for routing, state management, etc.

Official component library for building mobile apps —now supported in both tools.

Image for post
Background

React was created for the purpose of targeting specific needs at Facebook, and it continues to be maintained by the tech giant. In the past there were doubts regarding React’s license; currently, however, the tool operates under the MIT License — which makes it open source.

React’s corporate backing, especially from such a major player, indicates stability in the future and implies that React will continue to be developed with long-term support.

Vue, on the other hand, was built by one developer, Evan You, in order to improve on available JS tools. A former Google employee on their Angular team, Evan You wanted to create a framework that combined the best approaches to frontend development from Angular, Ember, and React with other features that made writing Web apps faster, easier, and more pleasant.

From the get-go, Vue was a truly open source project, relying on the community, contributors, and crowdfunding to move forward.

Syntax

One of the biggest differences between Vue and React is the way the view layer is built.

By default, Vue uses HTML templates, but there’s an option to write in JSX.

In React, on the other hand, there’s solely JSX. Vue’s traditional separation of concerns into HTML, CSS, and JS makes it easier even for beginner frontend developers to learn how to create Web applications. HTML templates are also familiar to most Web designers, and thus improve collaboration between developers and designers.

React’s JavaScript Expressions (JSX) combine HTML and CSS together into JavaScript. This XML-like syntax lets developers build self-contained UI components with view-rendering instructions included. We’ll talk about what that means later in the article.

Talent Availability and Hiring Demand

Although Vue.js is easy to learn, there are significantly more React developers on the market. So if there is a business need for a more complex app, getting an experienced React developer who can jump into the project and start working immediately can take less time. From the following graphs we can see that there is a larger fraction of developers who used React but would not use again compared to those who used Vue but would not use it again.

Image for post
Comparing front-end frameworks over time. Source: State of JavaScript 2020
React was ranked the Most Used JavaScript Technology in the latest State of JavaScript report.

Image for post
Developer satisfaction for front-end frameworks over time. Source: State of JavaScript 2020
Image for post
Developer satisfaction Positive/Negative Split. Source: State of JavaScript 2020
It is worth noting that both Nuxt (the vue.js framework) and Next.js (the react framework) share equal usage.

Image for post
Rating for other tools based on freeform answers. Source: State of JavaScript 2020
Developer Insight

The way professionals see React and Vue might help others decide which of the two is more suited to their current expectations and capabilities.

What devs love about Vue.js:

Easy learning curve
Elegant programming style and patterns
Good documentation
Image for post
Source: State of JavaScript 2018
What devs love about React:

Elegant programming style and patterns
Rich package ecosystem
Widespread usage
Image for post
Source: State of JavaScript 2018
After taking the top spot in the most-used web framework list in the 2020 Stack Overflow Survey, with 35.9% respondents choosing React, it continues to be the second most popular framework.

Image for post
Web frameworks used most often. Source: Stack Overflow Survey
Vue.js has ranked 7th on the Stack Overflow survey. Given its steadily rising popularity, we can predict its growth in the following years.

Image for post
Most-loved frameworks, libraries, and tools. Source: Stack Overflow Survey
Both React.js and Vue.js have been listed as the Most Loved Web frameworks in the Stack Overflow 2020 survey, with Vue taking a second place lower only by less than 3%.

Best Use Cases of Vue vs React

Vue.js

Being a progressive framework, Vue can be integrated into an existing project incrementally, per project requirements. For example, as a lightweight library to add some interactivity to a Web application.

In fact, 76% of developers participating in the 2019 edition of the State of Vue.js Report consider ease of integration Vue’s biggest asset.

Image for post
Vue’s biggest advantage. Source: State of Vue.js
With an easy learning curve and tools such as Vue CLI 4and Vue UI, Vue is excellent for quick delivery of MVPs and startup ideas. Because of those, Vue is also a cost-effective solution for small to medium apps.

Don’t let that fool you into believing Vue isn’t a good fit for large Web apps. Quite the opposite. Vue has a vast ecosystem of tools and companion libraries, allowing the framework to respond to the complex needs of enterprise-grade applications.

In addition vue also provides official vetur extension for vs code which offers great auto completion and linting features and official vue dev tools for efficient debugging of vue apps.

React

Since React was created for large-scale Web projects, choosing it for small and simple apps might be overkill. Although it requires a lot of boilerplate code just to set up a working project, React’s architecture ultimately pays off in the long run.

JSX leaves developers the full power of JavaScript at their disposal — flow controls and advanced IDE features such as autocompletion or listing are included in the component view templates.

Unlike Vue, React doesn’t have official packages for routing or state management. To build complex apps, you have to use third-party solutions for pretty much everything. But the choice is vast. Experienced developers tasked with delivering advanced projects will know which of the numerous libraries will be the best choice to meet the business demands of a particular Web application.

Web Apps Made with Vue.js and React

Both Vue and React are used by many internationally renowned services and apps.

Here are five companies which use Vue:

Euronews
Behance
Alibaba
Trustpilot
Vice
And another five which chose React:

Airbnb
Disqus
PayPal
The New York Times
Netflix
It’s worth noting that React is also used in Instagram and WhatsApp — services belonging to Facebook.

The Right Tool Depends on Your Needs

Vue.js and React are both great tools for building interactive user interfaces. To choose which one is better for your next project, you have to take a number of factors into account, including your specific use case, your business needs, environment, developer availability, budget, and the timeframe you’re working with.

Vue is lightweight, easy to learn, and pleasant to write in. Because of its familiar templating syntax and use of components, integrating or migrating existing projects to Vue is faster and smoother. For that reason, Vue.js is great for startups but can be just as well used in large-scale applications.

Performance-wise, Vue.js is on a par with React. However, final results essentially depend on optimization efforts and application size. The documentation is excellent, explaining everything in minute detail.

Vue has official packages for state management, routing, or server-side rendering, which come with up-to-date support and ensure synchronization throughout your system. With Vue CLI 4and Vue UI, setting up a project and preparing it for deployment is lightning fast. This, in turn, helps build MVPs in a quick and efficient manner.

React, on the other hand, is a veteran of the JS field. With corporate support, a large community, and an even bigger ecosystem, React is great for building complex enterprise-grade applications. Also, the job market is booming with experienced React developers, so you won’t find yourself in short supply of specialists. Because its maturity and community, reaching out for help and getting a prompt and detailed answer is more or less guaranteed.

Conclusion / Why I prefer Vue over React

I have more experience with Vue.js compared to React, so this may be a cause for bias — hence why I am writing my views separately.

The number one reason for me preferring Vue over React is developer experience — not in terms of the syntax and features but the smooth working of hot reloading. Not sure if there is some issue with how I set up my system, but I see similar issues clearly visible in many React video tutorials as well. Hot reloading of React is very poor and very often I need to close and restart the browser or turn the react server on/off or both to continue working on the project. I face this issue a lot with both React and next.

Note: The above experience is something I faced only when using Next.js v10.0.5. If you are facing same/similar issues or if you know the way to make it work faster and smoother, please write that in the comments.

Secondly, Vue has support for both template as well as JSX and that makes it much more friendly. Thirdly, along with the TypeScript support Vue also has inbuilt type checking for example in case of props. Fourth, extensive documentation, a very well organised life cycle and easy optimization makes working with vue a great experience.

React on the other hand has advantage of more job opportunities and Next.js performs a bit better than Nuxt in terms of SEO, SSR and static site generation.