//
//  Category.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-16.
//

import Foundation

struct Category {
    let id: String
    let title: String
    let imageName: String
    var articleContent: [ArticleContent]
    var musicContent: [MusicContent]
    var exerciseContent: [ExerciseContent]
    
    
    static var categories: [Category] = [
        
        Category(id: "1", title: "Happiness", imageName: "HapinessLogo", articleContent: [
            ArticleContent(id: "articleH1", title: "The path to happiness", imageName: "HapinessLogo", contentInfo: "Happiness is a state of mind that brings joy, contentment, and fulfillment. It is not something we stumble upon but rather a choice we make each day. Embracing happiness is essential for our overall well-being and can have a profound impact on our lives. Finding happiness begins with cultivating a positive mindset. It involves focusing on the present moment and appreciating the simple pleasures life offers. Whether it's savoring a delicious meal, spending quality time with loved ones, or enjoying a beautiful sunset, happiness can be found in the little things. \n\nPracticing gratitude is another powerful way to invite happiness into our lives. Taking a few moments each day to reflect on the things we are grateful for can shift our perspective and bring a sense of contentment. Gratitude reminds us of the abundance around us and helps us appreciate the blessings in our lives. Engaging in activities that bring us joy and fulfillment is also key to experiencing happiness. Whether it's pursuing a hobby, engaging in creative outlets, or participating in physical exercise, doing what we love boosts our mood and enhances our overall well-being. \n\n It's important to remember that happiness is a journey, not a destination. It's not about constant euphoria but rather a sense of inner peace and satisfaction. Embracing both positive and negative experiences, learning from challenges, and focusing on personal growth contribute to long-lasting happiness. In conclusion, happiness is within our reach. By choosing to adopt a positive mindset, practicing gratitude, and engaging in activities that bring us joy, we can cultivate happiness in our everyday lives. Embrace the power of positivity and embark on a journey of happiness that will enrich your life and the lives of those around you."),
            ArticleContent(id: "articleH2", title: "Unfolding Happiness", imageName: "HapinessLogo", contentInfo: "Happiness, a desirable yet elusive emotion, is an overall state of contentment that touches our lives in profound ways, regardless of circumstances. This article offers a fresh perspective on fostering enduring happiness, moving beyond fleeting moments of joy to the cultivation of deep-seated fulfillment. \n\n Discovering Your Purpose: \n\n Every individual has unique talents, passions, and capabilities. Using these to pursue a greater purpose often brings a profound sense of fulfillment and direction. Finding your purpose could be as simple as asking yourself, what are you passionate about? What impact do you want to make in your world? The answers to these questions might be your first steps towards sustained happiness. \n\n Building Positive Relationships: \n\n We are innately social beings who thrive on connection, companionship, and shared experiences. Fostering meaningful relationships with those around us—family, friends, and community—can greatly enhance our sense of happiness. Such relationships generate feelings of acceptance, love, and support, all fundamental to our emotional wellbeing. \n\n Cultivating Mindfulness: \n\n Often, happiness is found in the present moment, yet we spend much of our lives reliving the past or worrying about the future. Mindfulness, a state of active, open attention on the present, helps us appreciate the beauty of the now. This could be as simple as focusing on your breath, savoring a meal, or watching a sunset. Through mindfulness, we can fully appreciate life's richness as it unfolds. \n\n Giving Back: \n\n Kindness, generosity, and altruism have a unique way of fostering our own happiness. Helping others triggers the release of endorphins—known as the 'feel-good hormones'—creating a 'helper's high' Moreover, seeing the positive impact of our actions can offer a profound sense of satisfaction and joy. \n\n Caring for Your Physical Health: \n\n There is a profound link between our physical and emotional well-being. Regular physical activity promotes overall health, boosts mood, and reduces stress, thanks to the release of endorphins. Coupled with a balanced diet and adequate sleep, caring for our physical health contributes to a happier state of being. \n\n In conclusion, happiness isn't a one-size-fits-all concept—it's a personal, unique journey filled with both triumphs and trials. Embrace life with all its imperfections, cherish each moment, and remember that happiness is an inside job—you're in the driver's seat.")
        ], musicContent: [
            MusicContent(id: "musicH1", title: "Mood Booster", imageName: "music1", contentInfo: "This is music test 1 happy", duration: 215, musicFile: "TheRoadAhead")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseH1", title: "Exercise content", imageName: "hapinessLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseH1"))
        ]),
        
        Category(id: "2", title: "Meditation", imageName: "MeditationLogo", articleContent: [
            ArticleContent(id: "articleM1", title: "A Primer on Meditation", imageName: "MeditationLogo", contentInfo: "Meditation, a millennia-old practice, has gained global popularity as a powerful tool for calming the mind, reducing stress, and promoting overall well-being. It's not tied to a specific culture or religion; it's a personal practice that can take numerous forms depending on one's preferences and goals. \n\n Understanding Meditation: \n\n Meditation is a mental exercise that involves relaxation, focus, and awareness. It's not about changing your thoughts, but rather about becoming aware of them and understanding their transient nature. The goal is to cultivate a calmer, more tranquil state of mind. \n\n Types of Meditation: \n\n There are numerous forms of meditation. Mindfulness meditation encourages paying attention to the present moment without judgement, while loving-kindness meditation fosters feelings of compassion towards oneself and others. Transcendental meditation, on the other hand, utilizes a mantra or series of words that are repeated in a specific sequence. \n\n Benefits of Meditation: \n\n Regular meditation can bring about profound benefits. It can lower stress levels, improve focus and memory, enhance emotional well-being, and even have positive effects on physical health by lowering blood pressure and improving sleep. \n\n Starting a Meditation Practice: \n\n To start meditating, you needn't have anything more than a quiet space and a few minutes each day. Start by sitting comfortably, closing your eyes, and focusing on your breath. Your mind will wander, but when it does, gently bring it back to the breath. There's no 'right' way to meditate—it's about finding what works best for you. \n\n In conclusion, meditation is a versatile tool that can support mental and physical health. Whether you're looking to reduce stress, increase focus, or simply become more aware of your own thoughts and emotions, meditation offers a path to achieving these goals. Start small, be patient with yourself, and remember that it's all about the journey, not the destination.")
            
        ], musicContent: [
            MusicContent(id: "musicM1", title: "Music content meditation", imageName: "MeditationLogo", contentInfo: "This is music test 1 meditation", duration: 70, musicFile: "musicM1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseM1", title: "Exercise content meditation", imageName: "MeditationLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseM1"))
        ]),
        
        Category(id: "3", title: "Stress", imageName: "ReduceStressLogo", articleContent: [
            ArticleContent(id: "articleS1", title: "Decoding Stress", imageName: "ReduceStressLogo", contentInfo: "Stress is an inevitable part of life, often surfacing in response to challenging or threatening situations. While moderate stress can be beneficial, propelling us into action and promoting growth, chronic stress can have far-reaching effects on our overall wellbeing. \n\n Identifying Stress: \n\n Stress can manifest in numerous ways. Physically, it might lead to headaches, stomach issues, or sleep disturbances. Emotionally, stress can cause feelings of overwhelm, irritability, or sadness. Becoming familiar with your personal stress signals can help you better manage this emotional state. \n\n Stress Triggers: \n\n Stressors are unique to each individual. Common ones include job pressure, financial worries, relationship troubles, or major life changes. Understanding what triggers your stress is the first step toward managing it effectively. \n\n Coping with Stress: \n\n Healthy coping strategies include exercise, balanced nutrition, adequate sleep, and positive social interactions. Developing resilience, the capacity to recover quickly from difficulties, is another powerful tool in combating stress. \n\n Seeking Support: \n\n When stress becomes overwhelming, seeking professional help can be beneficial. Therapists and counselors are trained to help you develop effective strategies for managing stress and improving overall wellbeing. "),
            ArticleContent(id: "articleS2", title: "Stress & Creativity", imageName: "ReduceStressLogo", contentInfo: "While stress is often painted in a negative light, it's not entirely without merit. One less explored aspect of stress is its connection to creativity, providing a fresh perspective on this ubiquitous life experience. \n\n Stress as a Creative Catalyst: \n\n Stress, in moderate amounts, can act as a catalyst for creativity. It can push us out of our comfort zones, compel us to see things from new perspectives, and inspire innovative problem-solving. \n\n Harnessing Stress: \n\n Transforming stress into a creative force involves a shift in perspective. Instead of viewing stress as a hindrance, we can treat it as a challenge that fuels our creativity. It's about channeling the energy that stress generates into creative endeavors. \n\n Balancing Stress and Creativity: \n\n While moderate stress can boost creativity, chronic stress can be detrimental. It's essential to strike a balance, ensuring we have sufficient downtime to rest and rejuvenate our creative resources. \n\n Fostering a Creative Environment: \n\n Building a creative environment can help us tap into our imaginative prowess while managing stress. This could involve setting up a dedicated workspace, surrounding ourselves with inspiring objects, or even seeking out nature, known to both lower stress and foster creativity. \n\n In conclusion, stress, when viewed through a different lens, can serve as a catalyst for creativity. The key lies in learning to harness its energy while ensuring it doesn't overwhelm us. This approach not only offers a way to manage stress but also provides a path to unlocking our creative potential. ")
        ], musicContent: [
            MusicContent(id: "musicS1", title: "Music content Stress", imageName: "ReduceStressLogo", contentInfo: "This is music test 1 Stress", duration: 70, musicFile: "musicS1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseS1", title: "Exercise content Stress", imageName: "ReduceStressLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseS1"))
        ]),
        
        Category(id: "4", title: "Sleep", imageName: "SleepLogo", articleContent: [
            ArticleContent(id: "articleSL1", title: "Power of Quality Sleep", imageName: "SleepLogo", contentInfo: "Quality sleep is essential for our overall well-being and plays a significant role in our physical and mental health. In this article, we will explore why quality sleep matters and the benefits it brings. \n\n Benefits of Quality Sleep: \n\n Physical Restoration: Quality sleep allows our bodies to repair and regenerate, boosting our immune system and promoting better physical health. \n\n Cognitive Function: Sleep enhances our cognitive abilities, including memory, focus, and problem-solving skills, leading to improved productivity and performance.\n\n Emotional Well-being: Adequate sleep helps regulate our emotions, reduces stress, and enhances our mood, contributing to better overall emotional well-being. \n\n Mental Health: Quality sleep is crucial for maintaining good mental health, supporting emotional resilience, and reducing the risk of mental health disorders. \n\n Tips for Better Sleep: \n\n Stick to a Consistent Schedule: Establish a regular sleep schedule, going to bed and waking up at the same time each day, to regulate your body's internal clock. \n\n Create a Restful Environment: Make sure your sleep environment is comfortable, quiet, and free from distractions to promote better sleep quality. \n\n Practice Relaxation Techniques: Engage in relaxation activities before bed, such as reading, deep breathing exercises, or gentle stretching, to help you unwind and prepare for sleep. \n\n Limit Stimulants: Avoid consuming caffeine and minimize the use of electronic devices close to bedtime, as they can interfere with your ability to fall asleep. \n\n Conclusion: Prioritizing quality sleep is crucial for optimal health and well-being. By understanding the importance of quality sleep and implementing healthy sleep habits, you can enjoy the numerous benefits it brings, leading to a happier, healthier life."),
            ArticleContent(id: "articleSL2", title: "Power napping", imageName: "SleepLogo", contentInfo: "In our busy lives, finding time for quality sleep can be challenging. However, there's a simple solution that can recharge your energy levels and enhance productivity - power napping. In this article, we'll explore the advantages of incorporating power naps into your routine. \n\n Enhanced Alertness and Focus: A quick 10 to 30-minute power nap can combat midday fatigue and improve alertness, concentration, and focus. It boosts cognitive function, making you more efficient and productive. \n\n Mood Elevation: Power naps have a positive impact on mood and emotional well-being. They reduce stress, irritability, and overwhelm, leaving you feeling refreshed and revitalized. \n\n Memory and Creativity Boost: Research suggests that power naps contribute to memory consolidation and enhance creativity. They unlock new perspectives and improve problem-solving skills. \n\n Tips for Effective Power Napping: Find your ideal nap duration. Create a peaceful environment. Set an alarm to avoid oversleeping. Time your nap strategically. Practice relaxation techniques beforehand. \n\n Conclusion: Incorporating power naps into your routine can optimize your energy levels, productivity, and overall well-being. By harnessing the benefits of short naps, you can recharge and tackle your day with renewed vigor.")
        ], musicContent: [
            MusicContent(id: "musicSL1", title: "Music content Sleep", imageName: "SleepLogo", contentInfo: "This is music test Sleep 1", duration: 70, musicFile: "musicSL1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseSL1", title: "Exercise content Sleep", imageName: "SleepLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseSL1"))
        ]),
        
        Category(id: "5", title: "Anxiety", imageName: "anxietyLogo", articleContent: [
            ArticleContent(id: "articleA1", title: "Finding Inner Peace", imageName: "anxietyLogo", contentInfo: "Anxiety is a common challenge that many people face in today's fast-paced and demanding world. In this article, we will explore the nature of anxiety and provide practical strategies to help you navigate through anxious moments and find a sense of inner peace. \n\n Understanding Anxiety: \n\n Anxiety is a natural response to stress, but when it becomes overwhelming and persistent, it can interfere with daily life. It manifests as feelings of unease, worry, and fear, often accompanied by physical symptoms such as rapid heartbeat and restlessness. \n\n Cultivating Inner Peace: \n\n Mindful Breathing: Practice deep breathing exercises to calm your mind and body. Focus on your breath, inhaling deeply through your nose and exhaling slowly through your mouth. This simple technique promotes relaxation and helps alleviate anxiety symptoms. \n\n Grounding Techniques: Engage your senses to bring your awareness to the present moment. Notice the sensations of your surroundings—touch, smell, sight, and sound. This grounding practice helps redirect your attention away from anxious thoughts and anchors you in the present. \n\n Thought Reframing: Challenge negative thoughts that fuel anxiety. Replace them with positive, rational, and realistic affirmations. Cultivate self-compassion and remind yourself that anxious thoughts are not always accurate reflections of reality. \n\n Self-Care Practices: Prioritize self-care to support your mental and emotional well-being. Engage in activities that bring you joy, such as hobbies, exercise, or spending time in nature. Nourish your body with healthy meals and ensure you get sufficient restful sleep. \n\n  Seeking Support: Reach out to trusted friends, family members, or mental health professionals for support. Sharing your feelings and concerns with others can provide comfort, guidance, and valuable perspective. \n\n Conclusion: Conquering anxiety is an ongoing journey, and finding inner peace requires consistent effort and self-compassion. By practicing mindfulness, grounding techniques, positive affirmations, self-care, and seeking support, you can gradually cultivate a greater sense of calm and resilience in the face of anxiety. Remember, you have the power to navigate through anxious moments and embrace a life filled with peace and well-being."),
            ArticleContent(id: "articleA2", title: "Managing Anxiety", imageName: "anxietyLogo", contentInfo: "Anxiety can feel like a persistent, invisible beast. It creeps up on us when we least expect it, often making day-to-day life seem more challenging than it should be. In this article, we aim to provide you with alternative strategies to help you tame this beast and thrive amidst its presence. \n\n Nurturing Mind-Body: \n\n Harmony Our minds and bodies are intrinsically linked. High levels of stress and anxiety can manifest in physical symptoms, such as a racing heart or shortness of breath. Conversely, caring for our physical health can help manage our mental state. Regular exercise, a balanced diet, and sufficient sleep are essential elements of a lifestyle that helps keep anxiety at bay. These aren't quick-fix solutions, but they form the foundation of a more resilient you. \n\n Reframing Anxiety: \n\n Anxiety often stems from a sense of dread about the future or regret about the past. One effective way to manage anxiety is to change how you perceive it. Instead of viewing anxiety as an enemy, think of it as an informant. Anxiety might be pointing you towards areas in your life that need attention. It could be an unresolved conflict, unmet needs, or a challenging decision that you've been avoiding. Instead of running away from these triggers, address them. This act of reframing can transform your anxiety into a tool for personal development. \n\n Expressive Therapies: \n\n Expressive therapies such as art, music, or dance allow you to externalize your inner turmoil. Creating art can serve as a non-verbal outlet for feelings that may be too complex or overwhelming to put into words. Through the process of creation, you may gain new insights into your feelings and find ways to cope with anxiety. \n\n Connection to Nature: \n\n Nature can offer a therapeutic escape from the hustle and bustle that often fuels our anxiety. Studies suggest that spending time in nature can reduce stress hormones, boost mood, and improve overall well-being. Whether it's a stroll in the park, gardening, or bird-watching, fostering a connection with nature can serve as a soothing balm for your anxious mind. \n\n Professional Help: \n\n While self-help strategies can be tremendously beneficial, it's essential not to overlook the value of professional help. Psychologists, psychiatrists, and therapists have the training and expertise to diagnose anxiety disorders and provide evidence-based treatment. Cognitive-behavioral therapy (CBT), for instance, is a type of psychotherapy that can help you understand and change thought patterns that lead to harmful behaviors and feelings.")
        ], musicContent: [
            MusicContent(id: "musicA1", title: "Music content anxiety", imageName: "anxietyLogo", contentInfo: "This is music test 1 anxiety", duration: 70, musicFile: "musicA1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseA1", title: "Exercise content anxiety", imageName: "anxietyLogo", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseA1"))
        ]),
        
        Category(id: "6", title: "Yoga", imageName: "yoga", articleContent: [
            ArticleContent(id: "articleY1", title: "Embracing Harmony", imageName: "yoga", contentInfo: "Yoga, an ancient practice originating in India over 5,000 years ago, is a harmonious union of mind, body, and spirit. It offers a holistic approach to wellness that extends beyond the physical benefits to mental and emotional wellbeing. \n\n Yoga's Essence: \n\n At its core, yoga is more than a physical exercise; it's a spiritual discipline aimed at bringing balance and health to the physical, mental, and spiritual aspects of life. The word 'yoga' itself stems from the Sanskrit word 'yuj,' meaning to join or unite, symbolizing the unity of all aspects of an individual: body, mind, and spirit. \n\n Yoga Styles: \n\n There are many styles of yoga, from the physically intensive Ashtanga and Vinyasa to the more relaxed and meditative Yin and Restorative yoga. Each style offers different benefits, and the choice depends on individual preferences and goals. \n\n Benefits of Yoga: \n\n Yoga's benefits are manifold. Physically, it can enhance flexibility, strength, and balance. Mentally, it can help reduce stress, promote relaxation, and improve focus. Spiritually, it fosters a sense of inner peace and connection to oneself and the world around. \n\n Starting Yoga: \n\n If you're new to yoga, start with a beginner's class or an online tutorial to learn the basics. Remember, it's not about how your pose looks compared to others—it's about how it feels to you. Always listen to your body, move at your own pace, and remember, the goal is balance, not strain. \n\n Consistency is Key: \n\n Regular practice is important in yoga, as its benefits accumulate over time. Whether it's a few minutes a day or a longer session several times a week, consistency is key. \n\n In conclusion, yoga offers a holistic approach to health and wellbeing that extends beyond physical fitness. It encourages us to embrace a balanced lifestyle, cultivate mindfulness, and foster a deeper connection with ourselves. Whether you're seeking stress relief, improved physical health, or spiritual growth, yoga offers a path towards achieving these goals.")
            
        ], musicContent: [
            MusicContent(id: "musicY1", title: "Music content yoga", imageName: "yoga", contentInfo: "This is music test 1 yoga", duration: 70, musicFile: "musicY1.mp3")
        ], exerciseContent: [
            ExerciseContent(id: "exerciseY1", title: "Exercise content yoga", imageName: "yoga", contentInfo: "", videoURL: URL(string: "https://example.com/exerciseY1"))
        ])
    ]
}

